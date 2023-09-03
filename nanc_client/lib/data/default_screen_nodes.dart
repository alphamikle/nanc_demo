import 'dart:convert';

import 'package:nanc_renderer/nanc_renderer.dart';

final List<TagNode> defaultScreenNodes = listOfTagNodesFromJson(jsonDecode(r'''
[
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "colors",
      "primary": "#FF0B59D5",
      "primaryDarken": "#FF0A50C0",
      "primaryDarkest": "#FF0948AD",
      "secondary": "#FFFFFFFF",
      "secondaryDarken": "#FFCDDEF7",
      "secondaryAccent": "#FFE9F2F9",
      "tertiary": "#FFFCB61A",
      "quaternary": "#FF999999",
      "quaternaryDarken": "#FF696E70",
      "quaternaryLighten": "#FFEEEEEE",
      "text.basic": "#FF000000",
      "text.light": "#FFDCDCDC"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "header",
      "height": "215"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "gap",
      "x1": "4",
      "x2": "8",
      "x3": "16",
      "x4": "24",
      "x5": "32",
      "x6": "48"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "font",
      "main": "DM Sans"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "star",
      "empty": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_empty.svg",
      "half": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_half.svg",
      "full": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_filled.svg"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "cart.count": "2"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "padding",
        "children": [
          {
            "type": "widget",
            "tag": "row",
            "children": [
              {
                "type": "widget",
                "tag": "show",
                "children": [
                  {
                    "type": "widget",
                    "tag": "sizedBox",
                    "children": [],
                    "attributes": {
                      "width": "{{ data.gap.x3 }}"
                    }
                  }
                ],
                "attributes": {
                  "ifFalse": "{{ template.noPrefix }}"
                }
              },
              {
                "type": "widget",
                "tag": "aspectRatio",
                "children": [
                  {
                    "type": "widget",
                    "tag": "container",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:decoration",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "8"
                            }
                          },
                          {
                            "type": "property",
                            "tag": "prop:shadow",
                            "children": [],
                            "attributes": {
                              "color": "#0F000000",
                              "blurRadius": "8",
                              "offsetY": "4"
                            }
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "column",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "expanded",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "clipRRect",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.image }}",
                                      "fit": "cover",
                                      "blurHash": "{{ template.blurHash }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "topLeft": "8",
                                  "topRight": "8"
                                }
                              }
                            ],
                            "attributes": {}
                          },
                          {
                            "type": "widget",
                            "tag": "padding",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "row",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [],
                                    "attributes": {
                                      "width": "{{ data.gap.x2 }}"
                                    }
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "column",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "subtitle",
                                          "text": "{{ template.title }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "smallBody",
                                          "text": "{{ template.subtitle }}"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "crossAxisAlignment": "start"
                                    }
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "spacer",
                                    "children": [],
                                    "attributes": {}
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "padding",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "svg",
                                            "children": [],
                                            "attributes": {
                                              "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/circle_chevron_right.svg"
                                            }
                                          }
                                        ],
                                        "attributes": {
                                          "size": "24"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "top": "{{ data.gap.x2 }}",
                                      "right": "{{ data.gap.x2 }}"
                                    }
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "all": "{{ data.gap.x2 }}"
                            }
                          }
                        ],
                        "attributes": {
                          "crossAxisAlignment": "start"
                        }
                      }
                    ],
                    "attributes": {
                      "color": "{{ data.colors.secondary }}"
                    }
                  }
                ],
                "attributes": {
                  "ratio": "1.3"
                }
              },
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [],
                "attributes": {
                  "width": "{{ data.gap.x3 }}"
                }
              }
            ],
            "attributes": {
              "mainAxisSize": "min"
            }
          }
        ],
        "attributes": {
          "top": "12",
          "bottom": "12"
        }
      }
    ],
    "attributes": {
      "id": "adCard"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "text",
        "children": [
          {
            "type": "property",
            "tag": "prop:textStyle",
            "children": [],
            "attributes": {
              "weight": "w500",
              "height": "1.25",
              "font": "{{ data.font.main }}"
            }
          }
        ],
        "attributes": {
          "text": "{{ template.text }}",
          "size": "18"
        }
      }
    ],
    "attributes": {
      "id": "subtitle"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "text",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "{{ template.text }}",
              "size": "12",
              "color": "{{ template.color }}"
            }
          }
        ],
        "attributes": {
          "ifTrue": "{{ template.color }}"
        }
      },
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "text",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "{{ template.text }}",
              "size": "12",
              "color": "{{ data.colors.quaternary }}"
            }
          }
        ],
        "attributes": {
          "ifFalse": "{{ template.color }}",
          "nullAsFalse": "true"
        }
      }
    ],
    "attributes": {
      "id": "smallBody"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "text",
        "children": [
          {
            "type": "property",
            "tag": "prop:textStyle",
            "children": [],
            "attributes": {
              "font": "{{ data.font.main }}"
            }
          }
        ],
        "attributes": {
          "text": "{{ template.text }}",
          "size": "14",
          "color": "{{ data.colors.text.basic }}",
          "maxLines": "2",
          "overflow": "ellipsis"
        }
      }
    ],
    "attributes": {
      "id": "middleBody"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "container",
            "children": [
              {
                "type": "property",
                "tag": "prop:decoration",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:borderRadius",
                    "children": [],
                    "attributes": {
                      "all": "30"
                    }
                  }
                ],
                "attributes": {
                  "color": "{{ template.color }}"
                }
              },
              {
                "type": "widget",
                "tag": "padding",
                "children": [
                  {
                    "type": "widget",
                    "tag": "row",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "padding",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "center",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "svg",
                                        "children": [],
                                        "attributes": {
                                          "ref": "{{ template.prefix }}"
                                        }
                                      }
                                    ],
                                    "attributes": {}
                                  }
                                ],
                                "attributes": {
                                  "size": "20"
                                }
                              }
                            ],
                            "attributes": {
                              "left": "2",
                              "right": "4"
                            }
                          }
                        ],
                        "attributes": {
                          "ifTrue": "{{ template.prefix }}"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "sizedBox",
                            "children": [],
                            "attributes": {
                              "width": "6"
                            }
                          }
                        ],
                        "attributes": {
                          "ifFalse": "{{ template.prefix }}",
                          "nullAsFalse": "true"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "font": "{{ data.font.main }}",
                              "color": "{{ template.textColor }}",
                              "weight": "w600"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.text }}",
                          "size": "14"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "padding",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "svg",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.suffix }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "size": "10"
                                }
                              }
                            ],
                            "attributes": {
                              "left": "6",
                              "right": "6"
                            }
                          }
                        ],
                        "attributes": {
                          "ifTrue": "{{ template.suffix }}"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "sizedBox",
                            "children": [],
                            "attributes": {
                              "width": "6"
                            }
                          }
                        ],
                        "attributes": {
                          "ifFalse": "{{ template.suffix }}",
                          "nullAsFalse": "true"
                        }
                      }
                    ],
                    "attributes": {
                      "mainAxisSize": "min"
                    }
                  }
                ],
                "attributes": {
                  "left": "6",
                  "top": "6",
                  "right": "6",
                  "bottom": "6"
                }
              }
            ],
            "attributes": {}
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "30"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "30"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "{{ template.onPressed }}"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.onPressed }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "roundButton"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "container",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:decoration",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "20"
                        }
                      }
                    ],
                    "attributes": {
                      "color": "{{ data.colors.primary }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "center",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:decoration",
                            "children": [
                              {
                                "type": "property",
                                "tag": "prop:borderRadius",
                                "children": [],
                                "attributes": {
                                  "all": "16"
                                }
                              }
                            ],
                            "attributes": {
                              "color": "{{ data.colors.secondary }}"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "center",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "container",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:decoration",
                                    "children": [
                                      {
                                        "type": "property",
                                        "tag": "prop:borderRadius",
                                        "children": [],
                                        "attributes": {
                                          "all": "12"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "color": "{{ data.colors.primary }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "size": "12"
                                }
                              }
                            ],
                            "attributes": {}
                          }
                        ],
                        "attributes": {
                          "size": "16"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {
                  "size": "20"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.current }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [
                  {
                    "type": "widget",
                    "tag": "center",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:decoration",
                            "children": [
                              {
                                "type": "property",
                                "tag": "prop:borderRadius",
                                "children": [],
                                "attributes": {
                                  "all": "12"
                                }
                              }
                            ],
                            "attributes": {
                              "color": "{{ data.colors.primary }}"
                            }
                          }
                        ],
                        "attributes": {
                          "size": "12"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {
                  "height": "20"
                }
              }
            ],
            "attributes": {
              "ifFalse": "{{ template.current }}",
              "nullAsFalse": "true"
            }
          }
        ],
        "attributes": {
          "ifTrue": "{{ template.active }}"
        }
      },
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "center",
                "children": [
                  {
                    "type": "widget",
                    "tag": "container",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:decoration",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "color": "{{ data.colors.quaternaryDarken }}"
                        }
                      }
                    ],
                    "attributes": {
                      "size": "12"
                    }
                  }
                ],
                "attributes": {}
              }
            ],
            "attributes": {
              "height": "20"
            }
          }
        ],
        "attributes": {
          "ifFalse": "{{ template.active }}"
        }
      }
    ],
    "attributes": {
      "id": "point"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "line",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "left": "11",
              "top": "10",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "point",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "left": "0",
              "top": "1"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.primary }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifTrue": "{{ template.active }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternaryDarken }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifFalse": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "bottomLeft"
                }
              }
            ],
            "attributes": {
              "height": "50"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "leftDot"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "row",
                "children": [
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "component",
                        "children": [],
                        "attributes": {
                          "id": "line",
                          "active": "{{ template.leftActive }}"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "component",
                        "children": [],
                        "attributes": {
                          "id": "line",
                          "active": "{{ template.rightActive }}"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {}
              }
            ],
            "attributes": {
              "left": "0",
              "top": "10",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "point",
                      "active": "{{ template.active }}",
                      "current": "{{ template.current }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "topCenter"
                }
              }
            ],
            "attributes": {
              "left": "0",
              "top": "1",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.primary }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifTrue": "{{ template.active }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternaryDarken }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifFalse": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "bottomLeft"
                }
              }
            ],
            "attributes": {
              "height": "50"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "dot"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "line",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "left": "0",
              "top": "10",
              "right": "11"
            }
          },
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "point",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "top": "1",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.primary }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifTrue": "{{ template.active }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternaryDarken }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifFalse": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "bottomLeft"
                }
              }
            ],
            "attributes": {
              "height": "50"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "rightDot"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "container",
            "children": [
              {
                "type": "property",
                "tag": "prop:decoration",
                "children": [],
                "attributes": {
                  "color": "{{ data.colors.primary }}"
                }
              }
            ],
            "attributes": {
              "height": "2",
              "width": "100"
            }
          }
        ],
        "attributes": {
          "ifTrue": "{{ template.active }}"
        }
      },
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "container",
            "children": [
              {
                "type": "property",
                "tag": "prop:decoration",
                "children": [],
                "attributes": {
                  "color": "{{ data.colors.quaternaryDarken }}"
                }
              }
            ],
            "attributes": {
              "height": "2",
              "width": "100"
            }
          }
        ],
        "attributes": {
          "ifFalse": "{{ template.active }}"
        }
      }
    ],
    "attributes": {
      "id": "line"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "sizedBox",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "line",
                      "active": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "left": "0",
                  "top": "10",
                  "right": "0"
                }
              }
            ],
            "attributes": {
              "fix": "expand"
            }
          }
        ],
        "attributes": {
          "height": "50"
        }
      }
    ],
    "attributes": {
      "id": "lineSpacer"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "aspectRatio",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "container",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:decoration",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:border",
                        "children": [],
                        "attributes": {
                          "color": "{{ data.colors.quaternaryLighten }}",
                          "width": "1.6"
                        }
                      },
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "column",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "center",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.image }}",
                                      "blurHash": "{{ template.blurHash }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "top": "4",
                                  "bottom": "4"
                                }
                              }
                            ],
                            "attributes": {}
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "column",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "column",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "smallBody",
                                          "text": "{{ template.subtitle }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "middleBody",
                                          "text": "{{ template.title }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [],
                                        "attributes": {
                                          "height": "{{ data.gap.x2 }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "richText",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.basic }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "{{ template.price }}"
                                            }
                                          },
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.light }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "  {{ template.pricePerUnit }}"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "crossAxisAlignment": "start"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x2 }}",
                                  "right": "{{ data.gap.x2 }}",
                                  "bottom": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "container",
                                "children": [],
                                "attributes": {
                                  "height": "1.6",
                                  "width": "500",
                                  "color": "{{ data.colors.quaternaryLighten }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "expanded",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "center",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "padding",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "row",
                                            "children": [
                                              {
                                                "type": "widget",
                                                "tag": "show",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "component",
                                                    "children": [],
                                                    "attributes": {
                                                      "id": "smallBody",
                                                      "text": "In stock",
                                                      "color": "{{ data.colors.text.basic }}"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "ifTrue": "{{ template.inStock }}"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "show",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "component",
                                                    "children": [],
                                                    "attributes": {
                                                      "id": "smallBody",
                                                      "text": "Out of stock",
                                                      "color": "{{ data.colors.text.basic }}"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "ifFalse": "{{ template.inStock }}",
                                                  "nullAsFalse": "true"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "padding",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "container",
                                                    "children": [],
                                                    "attributes": {
                                                      "width": "1",
                                                      "height": "14",
                                                      "color": "{{ data.colors.text.basic }}"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "left": "8",
                                                  "right": "8"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "sizedBox",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "svg",
                                                    "children": [],
                                                    "attributes": {
                                                      "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/location_dark.svg"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "size": "20"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "sizedBox",
                                                "children": [],
                                                "attributes": {
                                                  "width": "2"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "component",
                                                "children": [],
                                                "attributes": {
                                                  "id": "smallBody",
                                                  "text": "S23",
                                                  "color": "{{ data.colors.text.basic }}"
                                                }
                                              }
                                            ],
                                            "attributes": {}
                                          }
                                        ],
                                        "attributes": {
                                          "left": "{{ data.gap.x2 }}",
                                          "right": "{{ data.gap.x2 }}"
                                        }
                                      }
                                    ],
                                    "attributes": {}
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "crossAxisAlignment": "start"
                            }
                          }
                        ],
                        "attributes": {}
                      }
                    ],
                    "attributes": {
                      "crossAxisAlignment": "start"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "8"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "container",
                            "children": [],
                            "attributes": {
                              "color": "#00FFFFFF"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "{{ template.onPressed }}",
                          "splashColor": "{{ template.splashColor }}",
                          "highlightColor": "#00FFFFFF"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "roundButton",
                      "text": "Add",
                      "color": "{{ data.colors.primary }}",
                      "textColor": "{{ data.colors.secondary }}",
                      "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg",
                      "onPressed": "addToCart"
                    }
                  }
                ],
                "attributes": {
                  "top": "8",
                  "right": "8"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "ratio": "0.65"
        }
      }
    ],
    "attributes": {
      "id": "groceryCard"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "padding",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "svg",
                "children": [],
                "attributes": {
                  "ref": "{{ template.ref }}"
                }
              }
            ],
            "attributes": {
              "size": "16"
            }
          }
        ],
        "attributes": {
          "right": "{{ data.gap.x1 }}"
        }
      }
    ],
    "attributes": {
      "id": "star"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "row",
        "children": [
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 0.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 0.5 and template.rating < 1 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 1 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 1.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 1.5 and template.rating < 2 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 2 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 2.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 2.5 and template.rating < 3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 3.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 3.5 and template.rating < 4 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 4 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 4.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 4.5 and template.rating < 5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 5 }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "rating"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "aspectRatio",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "container",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:decoration",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:border",
                        "children": [],
                        "attributes": {
                          "color": "{{ data.colors.quaternaryLighten }}",
                          "width": "1.6"
                        }
                      },
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "column",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "center",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.image }}",
                                      "blurHash": "{{ template.blurHash }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "top": "4",
                                  "bottom": "4"
                                }
                              }
                            ],
                            "attributes": {}
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "column",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "column",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "smallBody",
                                          "text": "{{ template.subtitle }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "middleBody",
                                          "text": "{{ template.title }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [],
                                        "attributes": {
                                          "height": "{{ data.gap.x2 }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "richText",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.basic }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "{{ template.pricePerMonth }}"
                                            }
                                          },
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.light }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "  {{ template.price }}"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "crossAxisAlignment": "start"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x2 }}",
                                  "right": "{{ data.gap.x2 }}",
                                  "bottom": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "container",
                                "children": [],
                                "attributes": {
                                  "height": "1.6",
                                  "width": "500",
                                  "color": "{{ data.colors.quaternaryLighten }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "expanded",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "center",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "padding",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "row",
                                            "children": [
                                              {
                                                "type": "widget",
                                                "tag": "component",
                                                "children": [],
                                                "attributes": {
                                                  "id": "rating",
                                                  "rating": "{{ template.rating }}"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "sizedBox",
                                                "children": [],
                                                "attributes": {
                                                  "width": "{{ data.gap.x1 }}"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "component",
                                                "children": [],
                                                "attributes": {
                                                  "id": "smallBody",
                                                  "text": "({{ template.count }})",
                                                  "color": "{{ data.colors.text.light }}"
                                                }
                                              }
                                            ],
                                            "attributes": {}
                                          }
                                        ],
                                        "attributes": {
                                          "left": "{{ data.gap.x2 }}",
                                          "right": "{{ data.gap.x2 }}"
                                        }
                                      }
                                    ],
                                    "attributes": {}
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "crossAxisAlignment": "start"
                            }
                          }
                        ],
                        "attributes": {}
                      }
                    ],
                    "attributes": {
                      "crossAxisAlignment": "start"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "8"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "container",
                            "children": [],
                            "attributes": {
                              "color": "#00FFFFFF"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "{{ template.onPressed }}",
                          "splashColor": "{{ template.splashColor }}",
                          "highlightColor": "#00FFFFFF"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "roundButton",
                      "text": "Add",
                      "color": "{{ data.colors.primary }}",
                      "textColor": "{{ data.colors.secondary }}",
                      "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg",
                      "onPressed": "addToCart"
                    }
                  }
                ],
                "attributes": {
                  "top": "8",
                  "right": "8"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "ratio": "0.65"
        }
      }
    ],
    "attributes": {
      "id": "electronicsCard"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "padding",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [
                  {
                    "type": "widget",
                    "tag": "svg",
                    "children": [],
                    "attributes": {
                      "ref": "{{ template.image }}"
                    }
                  }
                ],
                "attributes": {
                  "size": "72"
                }
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "100"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "100"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "container",
                            "children": [],
                            "attributes": {
                              "color": "#00FFFFFF"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "snackbar: Brand!"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "right": "{{ data.gap.x3 }}"
        }
      }
    ],
    "attributes": {
      "id": "brand"
    }
  },
  {
    "type": "widget",
    "tag": "sliverPersistentHeader",
    "children": [
      {
        "type": "widget",
        "tag": "container",
        "children": [
          {
            "type": "widget",
            "tag": "column",
            "children": [
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [],
                "attributes": {
                  "height": "44"
                }
              },
              {
                "type": "widget",
                "tag": "padding",
                "children": [
                  {
                    "type": "widget",
                    "tag": "row",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/images/avatar.png"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "size": "32"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [],
                                "attributes": {
                                  "width": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondary }}",
                                      "size": "14",
                                      "font": "{{ data.font.main }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "Hi, John"
                                }
                              }
                            ],
                            "attributes": {
                              "mainAxisSize": "min"
                            }
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "sizedBox",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "svg",
                                "children": [],
                                "attributes": {
                                  "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/logo.svg"
                                }
                              }
                            ],
                            "attributes": {
                              "size": "39"
                            }
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondaryDarken }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "$499.60"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [],
                                "attributes": {
                                  "width": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "stack",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "padding",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "svg",
                                            "children": [],
                                            "attributes": {
                                              "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/cart.svg"
                                            }
                                          }
                                        ],
                                        "attributes": {
                                          "size": "24"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "top": "4",
                                      "right": "4"
                                    }
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "positioned",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "container",
                                        "children": [
                                          {
                                            "type": "property",
                                            "tag": "prop:decoration",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:borderRadius",
                                                "children": [],
                                                "attributes": {
                                                  "all": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "color": "{{ data.colors.tertiary }}"
                                            }
                                          },
                                          {
                                            "type": "widget",
                                            "tag": "center",
                                            "children": [
                                              {
                                                "type": "widget",
                                                "tag": "dataBuilder",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "text",
                                                    "children": [],
                                                    "attributes": {
                                                      "text": "{{ data.cart.count }}",
                                                      "size": "9"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "buildWhen": "cart.count"
                                                }
                                              }
                                            ],
                                            "attributes": {}
                                          }
                                        ],
                                        "attributes": {
                                          "size": "14"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "top": "0",
                                      "right": "0"
                                    }
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "mainAxisAlignment": "end"
                            }
                          }
                        ],
                        "attributes": {}
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {
                  "left": "{{ data.gap.x3 }}",
                  "top": "{{ data.gap.x2 }}",
                  "right": "{{ data.gap.x3 }}",
                  "bottom": "{{ data.gap.x2 }}"
                }
              },
              {
                "type": "widget",
                "tag": "padding",
                "children": [
                  {
                    "type": "widget",
                    "tag": "textField",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:inputDecoration",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:inputBorder",
                            "children": [
                              {
                                "type": "property",
                                "tag": "prop:borderRadius",
                                "children": [],
                                "attributes": {
                                  "all": "60"
                                }
                              },
                              {
                                "type": "property",
                                "tag": "prop:borderSide",
                                "children": [],
                                "attributes": {
                                  "color": "#00FFFFFF",
                                  "width": "0"
                                }
                              }
                            ],
                            "attributes": {
                              "type": "outline"
                            }
                          },
                          {
                            "type": "property",
                            "tag": "prop:contentPadding",
                            "children": [],
                            "attributes": {
                              "left": "30"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "alias",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "center",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "svg",
                                            "children": [],
                                            "attributes": {
                                              "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/search.svg",
                                              "size": "21"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "size": "21"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "8",
                                  "top": "3"
                                }
                              }
                            ],
                            "attributes": {
                              "name": "prefixIcon"
                            }
                          },
                          {
                            "type": "property",
                            "tag": "prop:hintStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternary }}",
                              "size": "14",
                              "font": "{{ data.font.main }}"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "alias",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "center",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "material",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:borderRadius",
                                                "children": [],
                                                "attributes": {
                                                  "all": "3"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "inkWell",
                                                "children": [
                                                  {
                                                    "type": "property",
                                                    "tag": "prop:borderRadius",
                                                    "children": [],
                                                    "attributes": {
                                                      "all": "3"
                                                    }
                                                  },
                                                  {
                                                    "type": "widget",
                                                    "tag": "svg",
                                                    "children": [],
                                                    "attributes": {
                                                      "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/barcode.svg",
                                                      "size": "21"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "onPressed": "snackbar: Let's go scan!"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "type": "transparent"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "size": "21"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "right": "8"
                                }
                              }
                            ],
                            "attributes": {
                              "name": "suffixIcon"
                            }
                          }
                        ],
                        "attributes": {
                          "filled": "true",
                          "simpleBorders": "true",
                          "fillColor": "{{ data.colors.secondary }}",
                          "dense": "false",
                          "hint": "Search everything at Walmart"
                        }
                      }
                    ],
                    "attributes": {
                      "maxLines": "1",
                      "onChanged": "emit:search"
                    }
                  }
                ],
                "attributes": {
                  "all": "{{ data.gap.x3 }}"
                }
              },
              {
                "type": "widget",
                "tag": "row",
                "children": [
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "svg",
                                        "children": [],
                                        "attributes": {
                                          "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/home.svg"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "size": "20"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x3 }}",
                                  "right": "{{ data.gap.x1 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondary }}",
                                      "size": "12",
                                      "font": "{{ data.font.main }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "Carrollton Supercenter",
                                  "color": "{{ data.colors.secondary }}",
                                  "overflow": "ellipsis",
                                  "maxLines": "1"
                                }
                              }
                            ],
                            "attributes": {
                              "mainAxisSize": "min"
                            }
                          }
                        ],
                        "attributes": {
                          "height": "36",
                          "color": "{{ data.colors.primaryDarken }}"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "svg",
                                        "children": [],
                                        "attributes": {
                                          "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "size": "20"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x3 }}",
                                  "right": "{{ data.gap.x1 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondary }}",
                                      "size": "12",
                                      "font": "{{ data.font.main }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "Dallas 75220",
                                  "color": "{{ data.colors.secondary }}"
                                }
                              }
                            ],
                            "attributes": {
                              "mainAxisSize": "min"
                            }
                          }
                        ],
                        "attributes": {
                          "height": "36",
                          "color": "{{ data.colors.primaryDarkest }}"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {}
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "color": "{{ data.colors.primary }}",
          "height": "{{ data.header.height }}"
        }
      }
    ],
    "attributes": {
      "maxExtent": "{{ data.header.height }}",
      "minExtent": "{{ data.header.height }}",
      "floating": "true"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x1 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "for",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "adCard",
                  "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/ad_{{ cycle.value }}.jpeg",
                  "title": "Free Assembly",
                  "noPrefix": "{{ cycle.index }}",
                  "subtitle": "A new brand that looks good.",
                  "blurHash": "LQK^scRP%%%0pe%LnMSj.8W=Rkxt"
                }
              }
            ],
            "attributes": {
              "from": "1",
              "to": "4"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "280"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "column",
        "children": [
          {
            "type": "widget",
            "tag": "row",
            "children": [
              {
                "type": "widget",
                "tag": "column",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "subtitle",
                      "text": "Your order is on the way"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "smallBody",
                      "text": "Arrives today, 3pm – 4pm"
                    }
                  }
                ],
                "attributes": {
                  "mainAxisSize": "min",
                  "crossAxisAlignment": "start"
                }
              },
              {
                "type": "widget",
                "tag": "spacer",
                "children": [],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "roundButton",
                  "text": "Track",
                  "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg",
                  "color": "{{ data.colors.primary }}",
                  "textColor": "{{ data.colors.secondary }}",
                  "onPressed": "snackbar: Go to track!"
                }
              }
            ],
            "attributes": {}
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "height": "{{ data.gap.x4 }}"
            }
          },
          {
            "type": "widget",
            "tag": "row",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "leftDot",
                  "active": "true",
                  "title": "Placed"
                }
              },
              {
                "type": "widget",
                "tag": "expanded",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "lineSpacer",
                      "active": "true"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "dot",
                  "leftActive": "true",
                  "active": "true",
                  "rightActive": "true",
                  "title": "Preparing"
                }
              },
              {
                "type": "widget",
                "tag": "expanded",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "lineSpacer",
                      "active": "true"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "dot",
                  "leftActive": "true",
                  "active": "true",
                  "rightActive": "false",
                  "current": "true",
                  "title": "On the way"
                }
              },
              {
                "type": "widget",
                "tag": "expanded",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "lineSpacer",
                      "active": "false"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "rightDot",
                  "active": "false",
                  "title": "Delivered"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "mainAxisSize": "min",
          "crossAxisAlignment": "start"
        }
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "top": "{{ data.gap.x5 }}",
      "right": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x4 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Sort & Filter",
              "onPressed": "snackbar: Sort & Filter!",
              "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/menu.svg",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "In store",
              "onPressed": "snackbar: In store!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Price",
              "onPressed": "snackbar: Price!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Brand",
              "onPressed": "snackbar: Brand!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Size",
              "onPressed": "snackbar: Size!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Color",
              "onPressed": "snackbar: Color!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Weight",
              "onPressed": "snackbar: Weight!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "34"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x4 }}"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "richText",
        "children": [
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "Groceries",
              "size": "18",
              "color": "{{ data.colors.text.basic }}"
            }
          },
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": " (12.3k)",
              "size": "18",
              "color": "{{ data.colors.text.light }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "right": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/apple.png",
              "subtitle": "Final cost by weight",
              "title": "Gala Apples, 3lb Bag",
              "price": "$4.62",
              "pricePerUnit": "$2.27/lb",
              "inStock": "true",
              "onPressed": "snackbar: Apple!",
              "splashColor": "#1FCF011F"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/bread.png",
              "subtitle": "Wonder",
              "title": "Wonder Bread Classic",
              "price": "$2.39",
              "pricePerUnit": "11.9 ¢/oz",
              "inStock": "true",
              "onPressed": "snackbar: Bread!",
              "splashColor": "#1FD38B4E"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/milk.png",
              "subtitle": "Fairlife 2%",
              "title": "Ultra-Filtered Milk",
              "price": "$3.98",
              "pricePerUnit": "7.7 ¢/fl oz",
              "inStock": "true",
              "onPressed": "snackbar: Milk!",
              "splashColor": "#1F66BEEC"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/bananas.png",
              "subtitle": "Fresh Produce",
              "title": "Bananas, Each",
              "price": "$0.21",
              "pricePerUnit": "each",
              "inStock": "true",
              "onPressed": "snackbar: Bananas!",
              "splashColor": "#1FF5E673"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/peanut_cream.png",
              "subtitle": "18 oz, Great Value",
              "title": "Creamy Peanut Butter",
              "price": "$1.72",
              "pricePerUnit": "9.6 ¢/oz",
              "inStock": "true",
              "onPressed": "snackbar: Butter!",
              "splashColor": "#1F35221F"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/ice_cream.png",
              "subtitle": "Strawberry Cheesecake",
              "title": "Ben & Jerry's",
              "price": "$4.62",
              "pricePerUnit": "28.0 ¢/oz",
              "inStock": "false",
              "onPressed": "snackbar: Ice cream!",
              "splashColor": "#1F2A388F"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/avocados.png",
              "subtitle": "Fresh Produce",
              "title": "Hass Avocados",
              "price": "$3.78",
              "pricePerUnit": "$2.27/lb",
              "inStock": "true",
              "onPressed": "snackbar: Avocados!",
              "splashColor": "#1F5D7428"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/spinach.png",
              "subtitle": "Marketside",
              "title": "Fresh Spinach, 10 oz",
              "price": "$2.18",
              "pricePerUnit": "21.8 ¢/oz",
              "inStock": "true",
              "onPressed": "snackbar: Spinach!",
              "splashColor": "#1F2E4006"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "252"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x5 }}"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "component",
        "children": [],
        "attributes": {
          "id": "subtitle",
          "text": "Brands"
        }
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "right": "{{ data.gap.x3 }}",
      "bottom": "{{ data.gap.x4 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/gap_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/apple_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/tommy_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/boss_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/levis_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/nautica_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/boots_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/ikea_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/crocodile_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/nike_logo.svg"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "72"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x6 }}"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "richText",
        "children": [
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "Electronics",
              "size": "18",
              "color": "{{ data.colors.text.basic }}"
            }
          },
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": " (3.5k)",
              "size": "18",
              "color": "{{ data.colors.text.light }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "right": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/watch.png",
              "subtitle": "Apple",
              "title": "Apple Watch SE GPS",
              "price": "$279.00",
              "pricePerMonth": "$26/mo",
              "onPressed": "snackbar: Apple!",
              "splashColor": "#1FCABEB4",
              "rating": "4.5",
              "count": "135"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/camera.png",
              "subtitle": "Canon",
              "title": "Canon EOS Rebel T100",
              "price": "$379.00",
              "pricePerMonth": "$36/mo",
              "onPressed": "snackbar: Canon!",
              "splashColor": "#1F612E65",
              "rating": "3.1",
              "count": "1.4k"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/oneplus.png",
              "subtitle": "OnePlus",
              "title": "OnePlus Nord N200",
              "price": "$220.00",
              "pricePerMonth": "$21/mo",
              "onPressed": "snackbar: OnePlus!",
              "splashColor": "#1F0C2BBA",
              "rating": "3.6",
              "count": "70"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/projector.png",
              "subtitle": "Bomaker",
              "title": "Bomaker Projector",
              "price": "$320.00",
              "pricePerMonth": "$18/mo",
              "onPressed": "snackbar: Projector!",
              "splashColor": "#1F30AFF3",
              "rating": "3.2",
              "count": "80"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/headphones.png",
              "subtitle": "Bose",
              "title": "QuietComfort 45",
              "price": "$279.00",
              "pricePerMonth": "$24/mo",
              "onPressed": "snackbar: Headphones!",
              "splashColor": "#1F363636",
              "rating": "4.15",
              "count": "250"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/drone.png",
              "subtitle": "Contixo",
              "title": "Contixo F16 FPV",
              "price": "$180.00",
              "pricePerMonth": "$10/mo",
              "onPressed": "snackbar: Drone!",
              "splashColor": "#1F4F565D",
              "rating": "5.0",
              "count": "49"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "252"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x5 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "100"
    }
  }
]
'''));
