import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:untitled5/theme/constant.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  late GenerativeModel _model;
  late ChatSession _chat;

  // Courier service data
  final Map<String, dynamic> _courierData = {
    'pricing': {
      'local': {
        'base_price': 100,
        'per_kg': 20,
        'max_weight': 50,
      },
      'intercity': {
        'base_price': 200,
        'per_kg': 30,
        'max_weight': 100,
      },
      'international': {
        'base_price': 1000,
        'per_kg': 50,
        'max_weight': 200,
      }
    },
    'delivery_times': {
      'local': '1-2 business days',
      'intercity': '2-3 business days',
      'international': '5-7 business days'
    },
    'service_areas': {
      'local': ['Karachi', 'Lahore', 'Islamabad'],
      'intercity': 'All major cities in Pakistan',
      'international': 'Major countries worldwide'
    },
    'contact': {
      'phone': '03055261182',
      'email': 'support@ecourier.com',
      'address': '123 Main Street, City, Country'
    }
  };

  @override
  void initState() {
    super.initState();
    _initializeGemini();
    // Add initial greeting with service information
    _messages.add(ChatMessage(
      text:
          '''Hello! I'm your AI courier service assistant. I can help you with:
• Delivery pricing and quotes
• Delivery times and tracking
• Service areas and coverage
• Contact information
• General inquiries

How can I assist you today?''',
      isUser: false,
    ));
  }

  Future<void> _initializeGemini() async {
    try {
      _model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: 'AIzaSyDLHyyzjqAqW4-k5FtzL0qRo8zOxrRICgI',
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topK: 40,
          topP: 0.95,
          maxOutputTokens: 2048,
        ),
      );
      _chat = _model.startChat();
    } catch (e) {
      print('Error initializing Gemini: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Failed to initialize AI assistant. Please try again later.'),
          ),
        );
      }
    }
  }

  Future<void> _handleSubmitted(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: true));
      _isLoading = true;
    });

    try {
      // Create a structured prompt with courier data
      final prompt =
          '''You are a helpful courier service assistant for ECourier. Here is our service information:

Pricing:
- Local: Base price Rs.${_courierData['pricing']['local']['base_price']} + Rs.${_courierData['pricing']['local']['per_kg']}/kg
- Intercity: Base price Rs.${_courierData['pricing']['intercity']['base_price']} + Rs.${_courierData['pricing']['intercity']['per_kg']}/kg
- International: Base price Rs.${_courierData['pricing']['international']['base_price']} + Rs.${_courierData['pricing']['international']['per_kg']}/kg

Delivery Times:
- Local: ${_courierData['delivery_times']['local']}
- Intercity: ${_courierData['delivery_times']['intercity']}
- International: ${_courierData['delivery_times']['international']}

Service Areas:
- Local: ${_courierData['service_areas']['local'].join(', ')}
- Intercity: ${_courierData['service_areas']['intercity']}
- International: ${_courierData['service_areas']['international']}

Contact:
- Phone: ${_courierData['contact']['phone']}
- Email: ${_courierData['contact']['email']}
- Address: ${_courierData['contact']['address']}

Please provide a concise and helpful response to: $text''';

      final response = await _chat.sendMessage(Content.text(prompt));

      final responseText = response.text ??
          'I apologize, but I couldn\'t process your request. Please try again.';

      setState(() {
        _messages.insert(0, ChatMessage(text: responseText, isUser: false));
        _isLoading = false;
      });
    } catch (e) {
      print('Error getting response: $e');
      setState(() {
        _messages.insert(
            0,
            ChatMessage(
              text:
                  'I apologize, but I encountered an error. Please try again later.',
              isUser: false,
            ));
        _isLoading = false;
      });
    }

    _messageController.clear();
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isUser)
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: primaryColor.withOpacity(0.1),
                child: const Icon(Icons.support_agent, color: primaryColor),
              ),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: message.isUser
                    ? primaryColor.withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: message.isUser
                      ? primaryColor.withOpacity(0.2)
                      : Colors.grey[300]!,
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isUser ? primaryColor : Colors.black87,
                ),
              ),
            ),
          ),
          if (message.isUser)
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundColor: primaryColor.withOpacity(0.1),
                child: Icon(Icons.person, color: primaryColor),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Courier Assistant'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[index]),
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Ask anything about our courier service...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: primaryColor.withOpacity(0.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: primaryColor),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () =>
                          _handleSubmitted(_messageController.text),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
