import 'package:cubit_todo_app/cubit/todo_cubit.dart';
import 'package:cubit_todo_app/model/todoModel.dart';
import 'package:flutter/material.dart';
import 'package:cubit_todo_app/addtodoPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cubit Todo',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'My Todos',
                // style: TextStyle(),
                style: GoogleFonts.poppins(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: BlocBuilder<TodoCubit, List<Todo>>(
                builder: (context, state) {
                  if (state.isEmpty) {
                    // Show a default message when the list is empty
                    return Center(
                      child: Text(
                        'No todos available. Add some!',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.grey[600]),
                 
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final todo = state[index];
                      return ListTile(
                        title: Text(
                          todo.name,
                          style: GoogleFonts.poppins(),
                        ),
                        leading: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                          onPressed: () {
                            context.read<TodoCubit>().deleteTodo(todo);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 239, 217, 149),
        child: const Icon(Icons.add),
      ),
    );
  }
}
