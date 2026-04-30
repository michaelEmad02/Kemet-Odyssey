import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/external3d_viewer_sceen.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Build3DReconstruction extends StatefulWidget {
  const Build3DReconstruction(
      {super.key, required this.theme, required this.image3DUrl});
  final ThemeData theme;
  final String image3DUrl;

  @override
  State<Build3DReconstruction> createState() => _Build3DReconstructionState();
}

class _Build3DReconstructionState extends State<Build3DReconstruction> {
  bool get _isModelAsset {
    final uri = Uri.tryParse(widget.image3DUrl);
    final path = uri?.path.toLowerCase() ?? widget.image3DUrl.toLowerCase();
    return path.endsWith('.glb') || path.endsWith('.gltf');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: widget.theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: widget.theme.colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.view_in_ar_outlined,
                      color: widget.theme.colorScheme.primary, size: 24),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3D Reconstruction',
                      style: widget.theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Interactive Digital Archive',
                      style: widget.theme.textTheme.labelSmall?.copyWith(
                          color: widget.theme.colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Build3DContent(
                  widget: widget,
                  isModelAsset: _isModelAsset,
                  openExternalViewer: _openExternalViewer,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.touch_app,
                            color: Colors.white, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          'INTERACT',
                          style: widget.theme.textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_isModelAsset)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: FilledButton.tonalIcon(
                      onPressed: _openExternalViewer,
                      icon: const Icon(Icons.open_in_full, size: 16),
                      label: const Text('Fullscreen'),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Rotate, zoom, or pan the object to explore its intricate architectural details and ancient craftsmanship.',
              style: widget.theme.textTheme.bodySmall?.copyWith(
                  color: widget.theme.colorScheme.onSurfaceVariant,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 950.ms).scale(begin: const Offset(0.95, 0.95));
  }

  Future<void> _openExternalViewer() async {
    final url = widget.image3DUrl.trim();
    final uri = Uri.tryParse(url);
    if (uri == null) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => External3DViewerScreen(url: uri),
      ),
    );
  }
}

class Build3DContent extends StatelessWidget {
  const Build3DContent({
    super.key,
    required this.widget,
    required bool isModelAsset,
    required this.openExternalViewer,
  }) : _isModelAsset = isModelAsset;

  final Build3DReconstruction widget;
  final bool _isModelAsset;
  final VoidCallback openExternalViewer;

  @override
  Widget build(BuildContext context) {
    final isEmptyUrl = widget.image3DUrl.trim().isEmpty;
    if (isEmptyUrl) {
      return const Center(
        child: Text('3D content is not available for this place yet.'),
      );
    }

    if (_isModelAsset) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragStart: (_) {},
        onVerticalDragUpdate: (_) {},
        child: ModelViewer(
          backgroundColor: Colors.transparent,
          src: widget.image3DUrl,
          alt: "A 3D model of an ancient artifact",
          ar: true,
          autoRotate: true,
          cameraControls: true,
          disableZoom: false,
        ),
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.open_in_full,
              size: 42,
              color: widget.theme.colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              'For smoother zoom and pan, open this 3D tour in full-screen viewer.',
              style: widget.theme.textTheme.bodyMedium?.copyWith(
                color: widget.theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: openExternalViewer,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open 3D Viewer'),
            ),
          ],
        ),
      ),
    );
  }
}
