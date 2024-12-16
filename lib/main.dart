import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomFormScreen(),
    );
  }
}

class CustomFormScreen extends StatefulWidget {
  @override
  _CustomFormScreenState createState() => _CustomFormScreenState();
}

class _CustomFormScreenState extends State<CustomFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _agreeToTerms = false;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid!')),
      );
    } else if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must agree to the terms.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please correct the errors in the form.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation Form'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ClipPath(
            clipper: TopBottomZigZagClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[50],
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 221, 233, 231).withOpacity(0.5), // اللون الأساسي للتوهج
                    blurRadius: 15, // مدى نعومة التوهج
                    spreadRadius: 3, // مدى انتشار التوهج
                    offset: Offset(0, 2), // إزاحة للأسفل
                  ),
                  BoxShadow(
                    color: const Color.fromARGB(255, 154, 155, 155).withOpacity(0.3), // توهج إضافي
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: EmailValidator(errorText: 'Enter a valid email'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          labelText: 'Text',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: RequiredValidator(errorText: 'Text is required'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _numberController,
                        decoration: InputDecoration(
                          labelText: 'Number',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: PatternValidator(r'^[0-9]+$', errorText: 'Only numbers are allowed'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Yemeni Phone Number',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: PatternValidator(
                          r'^(9677|96773|96771)[0-9]{6}$',
                          errorText: 'Enter a valid Yemeni phone number',
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'I agree to the terms and conditions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      CustomButton(
                        label: 'Submit',
                        color: Colors.blue,
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom clipper for zigzag at top and bottom only
class TopBottomZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double zigzagWidth = 100;
    const double zigzagHeight = 15;
    final path = Path();
    path.moveTo(0, 0);
    for (double i = 0; i < size.width; i += zigzagWidth) {
      path.lineTo(i + zigzagWidth / 2, zigzagHeight);
      path.lineTo(i + zigzagWidth, 0);
    }
    path.lineTo(size.width, size.height - zigzagHeight);
    for (double i = size.width; i > 0; i -= zigzagWidth) {
      path.lineTo(i - zigzagWidth / 2, size.height);
      path.lineTo(i - zigzagWidth, size.height - zigzagHeight);
    }
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
