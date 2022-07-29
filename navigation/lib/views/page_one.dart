import 'package:flutter/material.dart';
import 'package:navigation/controllers/posts_controller.dart';
import 'package:navigation/widgets/custom_button_widget.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation:
                    Listenable.merge([_controller.posts, _controller.inLoader]),
                builder: (_, __) => _controller.inLoader.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _controller.posts.value.length,
                        itemBuilder: (_, index) => ListTile(
                          title: Text(_controller.posts.value[index].title),
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                // disable: true,
                onPressed: () => _controller.callAPI(),
                title: 'Button',
                titleSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
