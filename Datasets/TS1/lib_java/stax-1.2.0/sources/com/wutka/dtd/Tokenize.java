package com.wutka.dtd;

import java.io.File;
import java.net.URL;
import java.util.Enumeration;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/Tokenize.class */
class Tokenize {
    Tokenize() {
    }

    public static void main(String[] args) {
        DTDParser parser;
        try {
            if (args[0].indexOf("://") > 0) {
                parser = new DTDParser(new URL(args[0]), true);
            } else {
                parser = new DTDParser(new File(args[0]), true);
            }
            DTD dtd = parser.parse(true);
            if (dtd.rootElement != null) {
                System.out.println(new StringBuffer().append("Root element is probably: ").append(dtd.rootElement.name).toString());
            }
            Enumeration e = dtd.elements.elements();
            while (e.hasMoreElements()) {
                DTDElement elem = (DTDElement) e.nextElement();
                System.out.println(new StringBuffer().append("Element: ").append(elem.name).toString());
                System.out.print("   Content: ");
                dumpDTDItem(elem.content);
                System.out.println();
                if (elem.attributes.size() > 0) {
                    System.out.println("   Attributes: ");
                    Enumeration attrs = elem.attributes.elements();
                    while (attrs.hasMoreElements()) {
                        System.out.print("        ");
                        DTDAttribute attr = (DTDAttribute) attrs.nextElement();
                        dumpAttribute(attr);
                    }
                    System.out.println();
                }
            }
            Enumeration e2 = dtd.entities.elements();
            while (e2.hasMoreElements()) {
                DTDEntity entity = (DTDEntity) e2.nextElement();
                if (entity.isParsed) {
                    System.out.print("Parsed ");
                }
                System.out.println(new StringBuffer().append("Entity: ").append(entity.name).toString());
                if (entity.value != null) {
                    System.out.println(new StringBuffer().append("    Value: ").append(entity.value).toString());
                }
                if (entity.externalID != null) {
                    if (entity.externalID instanceof DTDSystem) {
                        System.out.println(new StringBuffer().append("    System: ").append(entity.externalID.system).toString());
                    } else {
                        DTDPublic pub = (DTDPublic) entity.externalID;
                        System.out.println(new StringBuffer().append("    Public: ").append(pub.pub).append(" ").append(pub.system).toString());
                    }
                }
                if (entity.ndata != null) {
                    System.out.println(new StringBuffer().append("    NDATA ").append(entity.ndata).toString());
                }
            }
            Enumeration e3 = dtd.notations.elements();
            while (e3.hasMoreElements()) {
                DTDNotation notation = (DTDNotation) e3.nextElement();
                System.out.println(new StringBuffer().append("Notation: ").append(notation.name).toString());
                if (notation.externalID != null) {
                    if (notation.externalID instanceof DTDSystem) {
                        System.out.println(new StringBuffer().append("    System: ").append(notation.externalID.system).toString());
                    } else {
                        DTDPublic pub2 = (DTDPublic) notation.externalID;
                        System.out.print(new StringBuffer().append("    Public: ").append(pub2.pub).append(" ").toString());
                        if (pub2.system != null) {
                            System.out.println(pub2.system);
                        } else {
                            System.out.println();
                        }
                    }
                }
            }
        } catch (Exception exc) {
            exc.printStackTrace(System.out);
        }
    }

    public static void dumpDTDItem(DTDItem item) {
        if (item == null) {
            return;
        }
        if (item instanceof DTDAny) {
            System.out.print("Any");
        } else if (item instanceof DTDEmpty) {
            System.out.print("Empty");
        } else if (item instanceof DTDName) {
            System.out.print(((DTDName) item).value);
        } else if (item instanceof DTDChoice) {
            System.out.print("(");
            DTDItem[] items = ((DTDChoice) item).getItems();
            for (int i = 0; i < items.length; i++) {
                if (i > 0) {
                    System.out.print("|");
                }
                dumpDTDItem(items[i]);
            }
            System.out.print(")");
        } else if (item instanceof DTDSequence) {
            System.out.print("(");
            DTDItem[] items2 = ((DTDSequence) item).getItems();
            for (int i2 = 0; i2 < items2.length; i2++) {
                if (i2 > 0) {
                    System.out.print(",");
                }
                dumpDTDItem(items2[i2]);
            }
            System.out.print(")");
        } else if (item instanceof DTDMixed) {
            System.out.print("(");
            DTDItem[] items3 = ((DTDMixed) item).getItems();
            for (int i3 = 0; i3 < items3.length; i3++) {
                if (i3 > 0) {
                    System.out.print(",");
                }
                dumpDTDItem(items3[i3]);
            }
            System.out.print(")");
        } else if (item instanceof DTDPCData) {
            System.out.print("#PCDATA");
        }
        if (item.cardinal == DTDCardinal.OPTIONAL) {
            System.out.print("?");
        } else if (item.cardinal == DTDCardinal.ZEROMANY) {
            System.out.print("*");
        } else if (item.cardinal == DTDCardinal.ONEMANY) {
            System.out.print("+");
        }
    }

    public static void dumpAttribute(DTDAttribute attr) {
        System.out.print(new StringBuffer().append(attr.name).append(" ").toString());
        if (attr.type instanceof String) {
            System.out.print(attr.type);
        } else if (attr.type instanceof DTDEnumeration) {
            System.out.print("(");
            String[] items = ((DTDEnumeration) attr.type).getItems();
            for (int i = 0; i < items.length; i++) {
                if (i > 0) {
                    System.out.print(",");
                }
                System.out.print(items[i]);
            }
            System.out.print(")");
        } else if (attr.type instanceof DTDNotationList) {
            System.out.print("Notation (");
            String[] items2 = ((DTDNotationList) attr.type).getItems();
            for (int i2 = 0; i2 < items2.length; i2++) {
                if (i2 > 0) {
                    System.out.print(",");
                }
                System.out.print(items2[i2]);
            }
            System.out.print(")");
        }
        if (attr.decl != null) {
            System.out.print(new StringBuffer().append(" ").append(attr.decl.name).toString());
        }
        if (attr.defaultValue != null) {
            System.out.print(new StringBuffer().append(" ").append(attr.defaultValue).toString());
        }
        System.out.println();
    }
}
