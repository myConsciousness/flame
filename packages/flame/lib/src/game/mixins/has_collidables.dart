import '../../../components.dart';
import '../../../game.dart';
import '../../collision/collision_detection.dart';

/// Keeps track of all the [Collidable]s in the component tree and initiates
/// collision detection every tick.
mixin HasCollidables on FlameGame {
  final CollisionDetection collisionDetection = CollisionDetection();

  @override
  void prepareComponent(Component component) {
    super.prepareComponent(component);
    if (component is Collidable) {
      collisionDetection.add(component);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    collisionDetection.run();
  }
}
