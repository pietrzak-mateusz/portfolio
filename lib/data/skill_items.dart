/// Categorized skills data for the portfolio's skills section.
/// 
/// Each category contains:
/// - `categoryKey`: Translation key for the category title
/// - `skills`: List of translation keys for individual skills in that category
/// 
/// The actual text values are retrieved via the i18n system using these keys.
/// This structure allows for easy internationalization and categorization of skills.
const List<Map<String, dynamic>> skillCategories = [
  {
    "categoryKey": "skills.software",
    "skills": [
      "skill.c",
      "skill.cpp",
      "skill.python",
      "skill.matlab",
      "skill.labview",
      "skill.bash",
      "skill.vhdl",
      "skill.git",
    ],
  },
  {
    "categoryKey": "skills.embedded",
    "skills": [
      "skill.stm32",
      "skill.avr",
      "skill.esp32",
    ],
  },
  {
    "categoryKey": "skills.sbc",
    "skills": [
      "skill.raspberry_pi",
    ],
  },
  {
    "categoryKey": "skills.pcb",
    "skills": [
      "skill.altium_designer",
      "skill.circuitstudio",
      "skill.pads",
      "skill.ltspice",
    ],
  },
  {
    "categoryKey": "skills.proto",
    "skills": [
      "skill.pcb_assembly",
      "skill.smd_tht_soldering",
      "skill.3d_printing",
    ],
  },
  {
    "categoryKey": "skills.test",
    "skills": [
      "skill.oscilloscope",
      "skill.multimeter",
      "skill.power_supplies",
      "skill.logic_analyzers",
      "skill.frequency_counters",
      "skill.waveform_generator",
    ],
  },
  {
    "categoryKey": "skills.other",
    "skills": [
      "skill.latex",
    ],
  },
];
