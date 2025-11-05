
import 'package:wallpaper_studio/data/models/category.dart';
import 'package:wallpaper_studio/data/models/wallpaper.dart';

final Category categoryPlaceholder = Category(
  id: '4',
  title: 'Nature',
  imageUrl: 'assets/wallpapers/nature/nature_bg.jpg',
  desc: 'Mountains, Forest and Landscapes',
  wallpapers: [],
);

final List<Wallpaper> wallpaperList = [
  Wallpaper(
    id: 'nat_001',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Nature',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/nature/nature1.jpg',
    title: 'Nature 1',
    description: 'A serene and breathtaking view of a **misty mountain range** at sunrise. The soft, diffuse sunlight breaks through the rolling fog, illuminating the rugged peaks and creating a sense of profound stillness and isolation. This high-resolution image captures the quiet majesty of alpine wilderness.',
    tags: ['mist', 'mountain', 'sunlit'],
  ),
  Wallpaper(
    id: 'nat_002',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Nature',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/nature/nature2.jpg',
    title: 'Nature 2',
    colorHex: '7F00FF',
    description: 'An immersive **macro shot of moss and fern foliage**. The deep, saturated greens and subtle hints of brown create a rich texture. Detailed dew drops cling to the leaves, catching the light and highlighting the intricate structure of the forest floor, perfect for a calming, organic feel.',
    tags: ['moss', 'green', 'macro'],
  ),
  Wallpaper(
    id: 'nat_003',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Nature',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/nature/nature3.jpg',
    title: 'Nature 3',
    description: 'A stunning **mirror-like reflection on a calm alpine lake**. The still water perfectly duplicates the silhouette of tall, dark pine trees and the cloudy sky above, emphasizing symmetry and tranquility. This image offers a peaceful, balanced aesthetic for your desktop.',
    tags: ['lake', 'reflection', 'calm'],
  ),
  Wallpaper(
    id: 'nat_004',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Nature',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/nature/nature4.jpg',
    title: 'Nature 4',
    description: 'A dramatic capture of **golden hour sunlight cutting through a dense forest**. The warm light beams diagonally across the scene, highlighting dust motes in the air and casting long, striking shadows from the tree trunks. An atmosphere of warmth and mystery pervades this woodland view.',
    tags: ['forest', 'golden', 'light'],
  ),
  Wallpaper(
    id: 'nat_005',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Nature',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/nature/nature5.jpg',
    title: 'Nature 5',
    description: 'An expansive **aerial view of rugged coastal cliffs** meeting the deep blue ocean. White foam from crashing waves contrasts sharply with the jagged, textured rock formations. The perspective captures the sheer scale and untamed power of the sea and coastline.',
    tags: ['coast', 'ocean', 'aerial'],
  ),
  Wallpaper(
    id: 'nat_006',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Nature',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/nature/nature6.jpg',
    title: 'Nature 6',
    description: 'A detailed photograph of a **single, brilliant sunflower** dominating a vast, slightly blurred yellow field. The focus on the intricate central pattern and vibrant petals makes this an uplifting, high-contrast wallpaper that symbolizes hope and vitality.',
    tags: ['flower', 'field', 'sunflower'],
  ),
  Wallpaper(
    id: 'abs_001',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Abstract',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/abstract/abstract_bg.jpg',
    title: 'Abstract 1',
    description: 'A powerful, **chaotic composition of melting, vibrant colors**—electric blues, hot pinks, and deep magentas—that swirl together in an intense, fluid motion. The wallpaper is a dynamic expression of abstract art, offering high energy and visual complexity.',
    tags: ['chaos', 'vibrant', 'paint'],
  ),
  Wallpaper(
    id: 'abs_002',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Abstract',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/abstract/abstract_bg.jpg',
    title: 'Abstract 2',
    description: 'A study in **soft, flowing gradient lines** that create a mesmerizing optical illusion of depth and movement. The muted palette relies on subtle shifts in color and tone, resulting in a sophisticated, calm, yet visually engaging backdrop.',
    tags: ['soft', 'illusion', 'gradient'],
  ),
  Wallpaper(
    id: 'min_001',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Minimalist',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/minimalist/minimalist_bg.jpg',
    title: 'Minimalist 1',
    description: 'The epitome of **clean and simple design**. A singular, softly-edged white geometric shape rests against an expanse of pale pastel gray. This wallpaper minimizes visual clutter, promoting focus and a modern, airy aesthetic.',
    tags: ['clean', 'pastel', 'simple'],
  ),
  Wallpaper(
    id: 'spc_001',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Space',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/space/space_bg.jpg',
    title: 'Space 1',
    description: 'A breathtaking image of a **distant, luminous nebula**. Swirls of crimson and turquoise dust clouds glow against the black velvet of space, dotted with countless pinpricks of starry light. This wallpaper offers a stunning view of deep-sky astronomy.',
    tags: ['nebula', 'cosmos', 'starry'],
  ),
  Wallpaper(
    id: 'spc_002',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Space',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/space/space_bg.jpg',
    title: 'Space 2',
    description: 'A dramatic vista of **swirling galaxies and dark matter**. This wallpaper features the vast, deep expanse where light is consumed by cosmic shadows, emphasizing the colossal scale and beautiful mystery of the universe.',
    tags: ['galaxy', 'dark', 'deep'],
  ),
  Wallpaper(
    id: 'spc_003',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Space',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/space/space_bg.jpg',
    title: 'Space 3',
    description: 'An artistic rendering of **planetary ring systems** illuminated by a powerful, central star. The rings cast long, intricate shadows across the planet\'s surface, resulting in a dramatic, complex, and high-fidelity astronomical scene.',
    tags: ['planet', 'rings', 'astronomy'],
  ),
  Wallpaper(
    id: 'aml_001',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Animals',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/animals/animals_bg.jpg',
    title: 'Animal 1',
    description: 'A striking **close-up portrait of a majestic wild lion**. The focus is sharp on the animal\'s intense eyes and richly textured mane, set against a blurred, sun-drenched background. This image conveys power, dignity, and the spirit of the savanna.',
    tags: ['lion', 'wild', 'portrait'],
  ),
  Wallpaper(
    id: 'ubn_001',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Urban',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/urban/urban_bg.jpg',
    title: 'Urban 1',
    description: 'A captivating **street-level view of a rain-soaked metropolis at dusk**. Neon lights reflect vividly off the wet pavement and passing cars, creating a blurred, impressionistic tapestry of color and movement typical of a busy city.',
    tags: ['street', 'rain', 'city'],
  ),
  Wallpaper(
    id: 'ubn_002',
    category: categoriesList.firstWhere(
          (category) => category.title == 'Urban',
      orElse: () => categoryPlaceholder,
    ),
    assetPath: 'assets/wallpapers/urban/urban_bg.jpg',
    title: 'Urban 2',
    description: 'An **elevated shot of traffic lines moving quickly** across a freeway during the twilight hour. The blur of headlights and taillights forms energetic, glowing streaks, symbolizing the hustle and flow of modern urban life.',
    tags: ['traffic', 'twilight', 'lines'],
  ),
];