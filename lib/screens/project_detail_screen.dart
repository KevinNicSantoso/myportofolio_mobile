import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      drawer: const LeftDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(project.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Year: ${project.year}'),
          const Divider(height: 24),
          Text(project.description),
        ],
      ),
    );
  }
}
