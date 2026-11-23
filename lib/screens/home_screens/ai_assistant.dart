
import 'package:fixly_app/screens/home_screens/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AiAssistant extends StatelessWidget {
  const AiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Llama Local Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  static const String ollamaUrl =
    'http://10.10.151.49:11434/api/chat';

  final List<Map<String, String>> chatMessages = [
    {
      "role": "system",
      "content": "You are a helpful assistant. Answer in Arabic."
    },
  ];

  Future<void> query(String prompt) async {
    final text = prompt.trim();

    if (text.isEmpty || isLoading) return;

    final message = {
      "role": "user",
      "content": text,
    };

    setState(() {
      chatMessages.add(message);
      isLoading = true;
    });

    _controller.clear();
    scrollToBottom();

    try {
      final data = {
        "model": "llama3.2",
        "messages": chatMessages,
        "stream": false,
      };

      final response = await http
          .post(
            Uri.parse(ollamaUrl),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 120));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (!mounted) return;

        setState(() {
          chatMessages.add({
            "role": "assistant",
            "content": responseData["message"]["content"],
          });
        });

        scrollToBottom();
      } else {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        chatMessages.add({
          "role": "assistant",
          "content": "حدث خطأ أثناء الاتصال بـ Ollama: $e",
        });
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Llama Chat"),
        centerTitle: true,
       leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
                    );
          },
        ),
     
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    if (chatMessages[index]["role"] == "system") {
                      return const SizedBox.shrink();
                    }

                    final message = chatMessages[index];
                    final isUser = message["role"] == "user";

                    return Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              MediaQuery.of(context).size.width * 0.8,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser
                              ? Colors.deepPurple[800]
                              : Colors.grey[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message["content"] ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),

              if (isLoading)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("Llama is thinking..."),
                    ],
                  ),
                ),

              const SizedBox(height: 12),

              TextField(
                controller: _controller,
                onSubmitted: (value) => query(value),
                decoration: InputDecoration(
                  labelText: "Enter your prompt",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: isLoading
                        ? null
                        : () => query(_controller.text),
                    icon: const Icon(
                      Icons.send,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
