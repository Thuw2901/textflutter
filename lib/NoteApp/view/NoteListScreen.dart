import 'package:flutter/material.dart';
import '../model/Note.dart';
import '../api/NoteAPIService.dart';
import 'AddNoteScreen.dart';
import 'NoteListItem.dart';
import 'LoginScreen.dart'; // Import màn hình đăng nhập
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'EditNoteScreen.dart';

class NoteListScreen extends StatefulWidget {
  final Function? onLogout; // Chỉnh sửa: Cho phép onLogout là null

  NoteListScreen({this.onLogout});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Future<List<Note>> _notesFuture;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    setState(() {
      _notesFuture = NoteAPIService.instance.getAllNotes();
    });
  }

  // Thêm phương thức xử lý đăng xuất trực tiếp trong class này
  Future<void> _handleLogout() async {
    // Xóa dữ liệu người dùng
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Kiểm tra xem widget có còn được gắn kết không
    if (!mounted) return;

    // Điều hướng trở lại màn hình đăng nhập và xóa tất cả các màn hình trước đó
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshNotes,
          ),
          // Thêm menu tùy chọn
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog();
              }
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Đăng xuất'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có ghi chú nào'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final note = snapshot.data![index];
                return NoteListItem(
                  note: note,
                  onDelete: () async {
                    await NoteAPIService.instance.deleteNote(note.id!);
                    _refreshNotes();
                  },
                  onEdit: () async {
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNoteScreen(note: note),
                      ),
                    );
                    if (updated == true) {
                      _refreshNotes();
                    }
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final created = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
          if (created == true) {
            _refreshNotes();
          }
        },
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Xác nhận đăng xuất'),
        content: Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();

              // Ưu tiên sử dụng hàm xử lý đăng xuất trong class này
              // Nếu widget.onLogout được cung cấp, gọi nó sau khi xử lý đăng xuất
              _handleLogout().then((_) {
                if (widget.onLogout != null) {
                  widget.onLogout!();
                }
              });
            },
            child: Text(
              'Đăng xuất',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}