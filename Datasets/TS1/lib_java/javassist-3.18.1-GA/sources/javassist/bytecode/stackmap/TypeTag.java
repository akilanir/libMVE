package javassist.bytecode.stackmap;

import javassist.bytecode.stackmap.TypeData;

/* loaded from: javassist-3.18.1-GA.jar:javassist/bytecode/stackmap/TypeTag.class */
public interface TypeTag {
    public static final String TOP_TYPE = "*top*";
    public static final TypeData TOP = new TypeData.BasicType(TOP_TYPE, 0);
    public static final TypeData INTEGER = new TypeData.BasicType("int", 1);
    public static final TypeData FLOAT = new TypeData.BasicType("float", 2);
    public static final TypeData DOUBLE = new TypeData.BasicType("double", 3);
    public static final TypeData LONG = new TypeData.BasicType("long", 4);
}
