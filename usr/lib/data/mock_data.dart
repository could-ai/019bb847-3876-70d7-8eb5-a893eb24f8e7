class Memoir {
  final String title;
  final String author;
  final String content;
  final List<String> reflectionQuestions;

  const Memoir({
    required this.title,
    required this.author,
    required this.content,
    required this.reflectionQuestions,
  });
}

class WritingPrompt {
  final String title;
  final String description;
  final List<String> steps;

  const WritingPrompt({
    required this.title,
    required this.description,
    required this.steps,
  });
}

// Mock Data
const Memoir sampleMemoir = Memoir(
  title: "The Scent of Rain",
  author: "Elena R.",
  content: """
The summer of 1998 smelled like wet asphalt and honeysuckle. I was ten years old, sitting on the porch swing, watching the storm clouds roll in over the hills. The sky turned a bruised purple, heavy and low.

"It's coming," my grandfather said, leaning against the railing. He didn't look at me, just watched the horizon.

I remember the silence right before the rain fell. The birds stopped singing. The wind held its breath. Then, the first drop hit the dusty step—*plip*. Then another. Within seconds, the world was a curtain of gray water.

We didn't go inside. We stayed there, letting the mist spray our faces, breathing in that sharp, clean scent of earth drinking its fill. That moment, quiet and loud all at once, is where I go when I need peace.
""",
  reflectionQuestions: [
    "What sensory details (smell, sight, sound) does the author use?",
    "How does the author describe the atmosphere before the rain?",
    "Why do you think this memory is significant to the author?",
  ],
);

const WritingPrompt narrativePrompt = WritingPrompt(
  title: "Capture a Moment",
  description: "Write a short narrative about a specific weather event from your childhood.",
  steps: [
    "Brainstorm: Choose a specific memory involving weather (snow day, storm, heatwave).",
    "Sensory Details: List 3 things you saw, heard, and felt.",
    "Draft: Write your scene. Focus on the atmosphere and how you felt in that moment.",
  ],
);
