.class public final Ljavassist/bytecode/ConstPool;
.super Ljava/lang/Object;
.source "ConstPool.java"


# static fields
.field public static final CONST_Class:I = 0x7

.field public static final CONST_Double:I = 0x6

.field public static final CONST_Fieldref:I = 0x9

.field public static final CONST_Float:I = 0x4

.field public static final CONST_Integer:I = 0x3

.field public static final CONST_InterfaceMethodref:I = 0xb

.field public static final CONST_Long:I = 0x5

.field public static final CONST_MethodHandle:I = 0xf

.field public static final CONST_Methodref:I = 0xa

.field public static final CONST_NameAndType:I = 0xc

.field public static final CONST_String:I = 0x8

.field public static final CONST_Utf8:I = 0x1

.field public static final REF_getField:I = 0x1

.field public static final REF_getStatic:I = 0x2

.field public static final REF_invokeInterface:I = 0x9

.field public static final REF_invokeSpecial:I = 0x7

.field public static final REF_invokeStatic:I = 0x6

.field public static final REF_invokeVirtual:I = 0x5

.field public static final REF_newInvokeSpecial:I = 0x8

.field public static final REF_putField:I = 0x3

.field public static final REF_putStatic:I = 0x4

.field public static final THIS:Ljavassist/CtClass;


# instance fields
.field items:Ljavassist/bytecode/LongVector;

.field itemsCache:Ljava/util/HashMap;

.field numOfItems:I

.field thisClassInfo:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 104
    const/4 v0, 0x0

    sput-object v0, Ljavassist/bytecode/ConstPool;->THIS:Ljavassist/CtClass;

    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    .line 172
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/ConstPool;->thisClassInfo:I

    .line 175
    invoke-direct {p0, p1}, Ljavassist/bytecode/ConstPool;->read(Ljava/io/DataInputStream;)V

    .line 176
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "thisclass"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    new-instance v0, Ljavassist/bytecode/LongVector;

    invoke-direct {v0}, Ljavassist/bytecode/LongVector;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    .line 159
    iput-object v1, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    .line 160
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 161
    invoke-direct {p0, v1}, Ljavassist/bytecode/ConstPool;->addItem0(Ljavassist/bytecode/ConstInfo;)I

    .line 162
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/ConstPool;->thisClassInfo:I

    .line 163
    return-void
.end method

.method private addItem(Ljavassist/bytecode/ConstInfo;)I
    .registers 5
    .param p1, "info"    # Ljavassist/bytecode/ConstInfo;

    .prologue
    .line 808
    iget-object v1, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    if-nez v1, :cond_c

    .line 809
    iget-object v1, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    invoke-static {v1}, Ljavassist/bytecode/ConstPool;->makeItemsCache(Ljavassist/bytecode/LongVector;)Ljava/util/HashMap;

    move-result-object v1

    iput-object v1, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    .line 811
    :cond_c
    iget-object v1, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ConstInfo;

    .line 812
    .local v0, "found":Ljavassist/bytecode/ConstInfo;
    if-eqz v0, :cond_19

    .line 813
    iget v1, v0, Ljavassist/bytecode/ConstInfo;->index:I

    .line 817
    :goto_18
    return v1

    .line 815
    :cond_19
    iget-object v1, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/LongVector;->addElement(Ljavassist/bytecode/ConstInfo;)V

    .line 816
    iget-object v1, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 817
    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    goto :goto_18
.end method

.method private addItem0(Ljavassist/bytecode/ConstInfo;)I
    .registers 4
    .param p1, "info"    # Ljavassist/bytecode/ConstInfo;

    .prologue
    .line 803
    iget-object v0, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/LongVector;->addElement(Ljavassist/bytecode/ConstInfo;)V

    .line 804
    iget v0, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    return v0
.end method

.method private static makeItemsCache(Ljavassist/bytecode/LongVector;)Ljava/util/HashMap;
    .registers 5
    .param p0, "items"    # Ljavassist/bytecode/LongVector;

    .prologue
    .line 1176
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1177
    .local v0, "cache":Ljava/util/HashMap;
    const/4 v1, 0x1

    .line 1179
    .local v1, "i":I
    :goto_6
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {p0, v1}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v3

    .line 1180
    .local v3, "info":Ljavassist/bytecode/ConstInfo;
    if-nez v3, :cond_f

    .line 1186
    return-object v0

    .line 1183
    :cond_f
    invoke-virtual {v0, v3, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v2

    .line 1184
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_6
.end method

.method private read(Ljava/io/DataInputStream;)V
    .registers 5
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1160
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    .line 1162
    .local v0, "n":I
    new-instance v2, Ljavassist/bytecode/LongVector;

    invoke-direct {v2, v0}, Ljavassist/bytecode/LongVector;-><init>(I)V

    iput-object v2, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    .line 1163
    const/4 v2, 0x0

    iput v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 1164
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Ljavassist/bytecode/ConstPool;->addItem0(Ljavassist/bytecode/ConstInfo;)I

    .line 1166
    :cond_12
    :goto_12
    add-int/lit8 v0, v0, -0x1

    if-lez v0, :cond_26

    .line 1167
    invoke-direct {p0, p1}, Ljavassist/bytecode/ConstPool;->readOne(Ljava/io/DataInputStream;)I

    move-result v1

    .line 1168
    .local v1, "tag":I
    const/4 v2, 0x5

    if-eq v1, v2, :cond_20

    const/4 v2, 0x6

    if-ne v1, v2, :cond_12

    .line 1169
    :cond_20
    invoke-virtual {p0}, Ljavassist/bytecode/ConstPool;->addConstInfoPadding()I

    .line 1170
    add-int/lit8 v0, v0, -0x1

    goto :goto_12

    .line 1173
    .end local v1    # "tag":I
    :cond_26
    return-void
.end method

.method private readOne(Ljava/io/DataInputStream;)I
    .registers 7
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1191
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    .line 1192
    .local v1, "tag":I
    packed-switch v1, :pswitch_data_a0

    .line 1236
    :pswitch_7
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid constant type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1194
    :pswitch_2c
    new-instance v0, Ljavassist/bytecode/Utf8Info;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/Utf8Info;-><init>(Ljava/io/DataInputStream;I)V

    .line 1239
    .local v0, "info":Ljavassist/bytecode/ConstInfo;
    :goto_33
    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem0(Ljavassist/bytecode/ConstInfo;)I

    .line 1240
    return v1

    .line 1197
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_37
    new-instance v0, Ljavassist/bytecode/IntegerInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/IntegerInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1198
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1200
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_3f
    new-instance v0, Ljavassist/bytecode/FloatInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/FloatInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1201
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1203
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_47
    new-instance v0, Ljavassist/bytecode/LongInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/LongInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1204
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1206
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_4f
    new-instance v0, Ljavassist/bytecode/DoubleInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/DoubleInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1207
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1209
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_57
    new-instance v0, Ljavassist/bytecode/ClassInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/ClassInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1210
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1212
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_5f
    new-instance v0, Ljavassist/bytecode/StringInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/StringInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1213
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1215
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_67
    new-instance v0, Ljavassist/bytecode/FieldrefInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/FieldrefInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1216
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1218
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_6f
    new-instance v0, Ljavassist/bytecode/MethodrefInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/MethodrefInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1219
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1221
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_77
    new-instance v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/InterfaceMethodrefInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1222
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1224
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_7f
    new-instance v0, Ljavassist/bytecode/NameAndTypeInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/NameAndTypeInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1225
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1227
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_87
    new-instance v0, Ljavassist/bytecode/MethodHandleInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/MethodHandleInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1228
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1230
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_8f
    new-instance v0, Ljavassist/bytecode/MethodTypeInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/MethodTypeInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1231
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1233
    .end local v0    # "info":Ljavassist/bytecode/ConstInfo;
    :pswitch_97
    new-instance v0, Ljavassist/bytecode/InvokeDynamicInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/InvokeDynamicInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1234
    .restart local v0    # "info":Ljavassist/bytecode/ConstInfo;
    goto :goto_33

    .line 1192
    nop

    :pswitch_data_a0
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_7
        :pswitch_37
        :pswitch_3f
        :pswitch_47
        :pswitch_4f
        :pswitch_57
        :pswitch_5f
        :pswitch_67
        :pswitch_6f
        :pswitch_77
        :pswitch_7f
        :pswitch_7
        :pswitch_7
        :pswitch_87
        :pswitch_8f
        :pswitch_7
        :pswitch_97
    .end packed-switch
.end method


# virtual methods
.method public addClassInfo(Ljava/lang/String;)I
    .registers 5
    .param p1, "qname"    # Ljava/lang/String;

    .prologue
    .line 878
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    .line 879
    .local v0, "utf8":I
    new-instance v1, Ljavassist/bytecode/ClassInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v1, v0, v2}, Ljavassist/bytecode/ClassInfo;-><init>(II)V

    invoke-direct {p0, v1}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v1

    return v1
.end method

.method public addClassInfo(Ljavassist/CtClass;)I
    .registers 3
    .param p1, "c"    # Ljavassist/CtClass;

    .prologue
    .line 853
    sget-object v0, Ljavassist/bytecode/ConstPool;->THIS:Ljavassist/CtClass;

    if-ne p1, v0, :cond_7

    .line 854
    iget v0, p0, Ljavassist/bytecode/ConstPool;->thisClassInfo:I

    .line 863
    :goto_6
    return v0

    .line 855
    :cond_7
    invoke-virtual {p1}, Ljavassist/CtClass;->isArray()Z

    move-result v0

    if-nez v0, :cond_16

    .line 856
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_6

    .line 863
    :cond_16
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_6
.end method

.method addConstInfoPadding()I
    .registers 3

    .prologue
    .line 841
    new-instance v0, Ljavassist/bytecode/ConstInfoPadding;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, v1}, Ljavassist/bytecode/ConstInfoPadding;-><init>(I)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem0(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addDoubleInfo(D)I
    .registers 6
    .param p1, "d"    # D

    .prologue
    .line 1053
    new-instance v1, Ljavassist/bytecode/DoubleInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v1, p1, p2, v2}, Ljavassist/bytecode/DoubleInfo;-><init>(DI)V

    invoke-direct {p0, v1}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    .line 1054
    .local v0, "i":I
    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_14

    .line 1055
    invoke-virtual {p0}, Ljavassist/bytecode/ConstPool;->addConstInfoPadding()I

    .line 1057
    :cond_14
    return v0
.end method

.method public addFieldrefInfo(II)I
    .registers 5
    .param p1, "classInfo"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 932
    new-instance v0, Ljavassist/bytecode/FieldrefInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, p2, v1}, Ljavassist/bytecode/FieldrefInfo;-><init>(III)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p1, "classInfo"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 920
    invoke-virtual {p0, p2, p3}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 921
    .local v0, "nt":I
    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(II)I

    move-result v1

    return v1
.end method

.method public addFloatInfo(F)I
    .registers 4
    .param p1, "f"    # F

    .prologue
    .line 1029
    new-instance v0, Ljavassist/bytecode/FloatInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/FloatInfo;-><init>(FI)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addIntegerInfo(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 1019
    new-instance v0, Ljavassist/bytecode/IntegerInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/IntegerInfo;-><init>(II)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addInterfaceMethodrefInfo(II)I
    .registers 5
    .param p1, "classInfo"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 994
    new-instance v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, p2, v1}, Ljavassist/bytecode/InterfaceMethodrefInfo;-><init>(III)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addInterfaceMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p1, "classInfo"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 980
    invoke-virtual {p0, p2, p3}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 981
    .local v0, "nt":I
    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/ConstPool;->addInterfaceMethodrefInfo(II)I

    move-result v1

    return v1
.end method

.method public addInvokeDynamicInfo(II)I
    .registers 5
    .param p1, "bootstrap"    # I
    .param p2, "nameAndType"    # I

    .prologue
    .line 1109
    new-instance v0, Ljavassist/bytecode/InvokeDynamicInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, p2, v1}, Ljavassist/bytecode/InvokeDynamicInfo;-><init>(III)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addLongInfo(J)I
    .registers 6
    .param p1, "l"    # J

    .prologue
    .line 1039
    new-instance v1, Ljavassist/bytecode/LongInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v1, p1, p2, v2}, Ljavassist/bytecode/LongInfo;-><init>(JI)V

    invoke-direct {p0, v1}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    .line 1040
    .local v0, "i":I
    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_14

    .line 1041
    invoke-virtual {p0}, Ljavassist/bytecode/ConstPool;->addConstInfoPadding()I

    .line 1043
    :cond_14
    return v0
.end method

.method public addMethodHandleInfo(II)I
    .registers 5
    .param p1, "kind"    # I
    .param p2, "index"    # I

    .prologue
    .line 1082
    new-instance v0, Ljavassist/bytecode/MethodHandleInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, p2, v1}, Ljavassist/bytecode/MethodHandleInfo;-><init>(III)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addMethodTypeInfo(I)I
    .registers 4
    .param p1, "desc"    # I

    .prologue
    .line 1095
    new-instance v0, Ljavassist/bytecode/MethodTypeInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/MethodTypeInfo;-><init>(II)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addMethodrefInfo(II)I
    .registers 5
    .param p1, "classInfo"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 961
    new-instance v0, Ljavassist/bytecode/MethodrefInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, p2, v1}, Ljavassist/bytecode/MethodrefInfo;-><init>(III)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p1, "classInfo"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 949
    invoke-virtual {p0, p2, p3}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 950
    .local v0, "nt":I
    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(II)I

    move-result v1

    return v1
.end method

.method public addNameAndTypeInfo(II)I
    .registers 5
    .param p1, "name"    # I
    .param p2, "type"    # I

    .prologue
    .line 903
    new-instance v0, Ljavassist/bytecode/NameAndTypeInfo;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, p2, v1}, Ljavassist/bytecode/NameAndTypeInfo;-><init>(III)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 892
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(II)I

    move-result v0

    return v0
.end method

.method public addStringInfo(Ljava/lang/String;)I
    .registers 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 1008
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    .line 1009
    .local v0, "utf":I
    new-instance v1, Ljavassist/bytecode/StringInfo;

    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v1, v0, v2}, Ljavassist/bytecode/StringInfo;-><init>(II)V

    invoke-direct {p0, v1}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v1

    return v1
.end method

.method public addUtf8Info(Ljava/lang/String;)I
    .registers 4
    .param p1, "utf8"    # Ljava/lang/String;

    .prologue
    .line 1067
    new-instance v0, Ljavassist/bytecode/Utf8Info;

    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/Utf8Info;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, v0}, Ljavassist/bytecode/ConstPool;->addItem(Ljavassist/bytecode/ConstInfo;)I

    move-result v0

    return v0
.end method

.method public copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 6
    .param p1, "n"    # I
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "classnames"    # Ljava/util/Map;

    .prologue
    .line 833
    if-nez p1, :cond_4

    .line 834
    const/4 v1, 0x0

    .line 837
    :goto_3
    return v1

    .line 836
    :cond_4
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    .line 837
    .local v0, "info":Ljavassist/bytecode/ConstInfo;
    invoke-virtual {v0, p0, p2, p3}, Ljavassist/bytecode/ConstInfo;->copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v1

    goto :goto_3
.end method

.method public eqMember(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .registers 7
    .param p1, "membername"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "index"    # I

    .prologue
    .line 792
    invoke-virtual {p0, p3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MemberrefInfo;

    .line 793
    .local v0, "minfo":Ljavassist/bytecode/MemberrefInfo;
    iget v2, v0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 795
    .local v1, "ntinfo":Ljavassist/bytecode/NameAndTypeInfo;
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 797
    iget v2, v0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v2

    .line 799
    :goto_2c
    return-object v2

    :cond_2d
    const/4 v2, 0x0

    goto :goto_2c
.end method

.method public getClassInfo(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 232
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ClassInfo;

    .line 233
    .local v0, "c":Ljavassist/bytecode/ClassInfo;
    if-nez v0, :cond_a

    .line 234
    const/4 v1, 0x0

    .line 236
    :goto_9
    return-object v1

    :cond_a
    iget v1, v0, Ljavassist/bytecode/ClassInfo;->name:I

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->toJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getClassInfoByDescriptor(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 249
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ClassInfo;

    .line 250
    .local v0, "c":Ljavassist/bytecode/ClassInfo;
    if-nez v0, :cond_a

    .line 251
    const/4 v1, 0x0

    .line 257
    :cond_9
    :goto_9
    return-object v1

    .line 253
    :cond_a
    iget v2, v0, Ljavassist/bytecode/ClassInfo;->name:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 254
    .local v1, "className":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5b

    if-eq v2, v3, :cond_9

    .line 257
    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 193
    iget v0, p0, Ljavassist/bytecode/ConstPool;->thisClassInfo:I

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getClassNames()Ljava/util/Set;
    .registers 7

    .prologue
    .line 1118
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 1119
    .local v2, "result":Ljava/util/HashSet;
    iget-object v4, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    .line 1120
    .local v4, "v":Ljavassist/bytecode/LongVector;
    iget v3, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 1121
    .local v3, "size":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_a
    if-ge v1, v3, :cond_1c

    .line 1122
    invoke-virtual {v4, v1}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljavassist/bytecode/ConstInfo;->getClassName(Ljavassist/bytecode/ConstPool;)Ljava/lang/String;

    move-result-object v0

    .line 1123
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_19

    .line 1124
    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1121
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 1126
    .end local v0    # "className":Ljava/lang/String;
    :cond_1c
    return-object v2
.end method

.method public getDoubleInfo(I)D
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 615
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/DoubleInfo;

    .line 616
    .local v0, "i":Ljavassist/bytecode/DoubleInfo;
    iget-wide v1, v0, Ljavassist/bytecode/DoubleInfo;->value:D

    return-wide v1
.end method

.method public getFieldrefClass(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 315
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FieldrefInfo;

    .line 316
    .local v0, "finfo":Ljavassist/bytecode/FieldrefInfo;
    iget v1, v0, Ljavassist/bytecode/FieldrefInfo;->classIndex:I

    return v1
.end method

.method public getFieldrefClassName(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 327
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FieldrefInfo;

    .line 328
    .local v0, "f":Ljavassist/bytecode/FieldrefInfo;
    if-nez v0, :cond_a

    .line 329
    const/4 v1, 0x0

    .line 331
    :goto_9
    return-object v1

    :cond_a
    iget v1, v0, Ljavassist/bytecode/FieldrefInfo;->classIndex:I

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getFieldrefName(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 353
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FieldrefInfo;

    .line 354
    .local v0, "f":Ljavassist/bytecode/FieldrefInfo;
    if-nez v0, :cond_a

    .line 361
    :cond_9
    :goto_9
    return-object v2

    .line 357
    :cond_a
    iget v3, v0, Ljavassist/bytecode/FieldrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 358
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 361
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method public getFieldrefNameAndType(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 340
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FieldrefInfo;

    .line 341
    .local v0, "finfo":Ljavassist/bytecode/FieldrefInfo;
    iget v1, v0, Ljavassist/bytecode/FieldrefInfo;->nameAndTypeIndex:I

    return v1
.end method

.method public getFieldrefType(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 374
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FieldrefInfo;

    .line 375
    .local v0, "f":Ljavassist/bytecode/FieldrefInfo;
    if-nez v0, :cond_a

    .line 382
    :cond_9
    :goto_9
    return-object v2

    .line 378
    :cond_a
    iget v3, v0, Ljavassist/bytecode/FieldrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 379
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 382
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method public getFloatInfo(I)F
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 593
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FloatInfo;

    .line 594
    .local v0, "i":Ljavassist/bytecode/FloatInfo;
    iget v1, v0, Ljavassist/bytecode/FloatInfo;->value:F

    return v1
.end method

.method public getIntegerInfo(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 582
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/IntegerInfo;

    .line 583
    .local v0, "i":Ljavassist/bytecode/IntegerInfo;
    iget v1, v0, Ljavassist/bytecode/IntegerInfo;->value:I

    return v1
.end method

.method public getInterfaceMethodrefClass(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 471
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    .line 473
    .local v0, "minfo":Ljavassist/bytecode/InterfaceMethodrefInfo;
    iget v1, v0, Ljavassist/bytecode/InterfaceMethodrefInfo;->classIndex:I

    return v1
.end method

.method public getInterfaceMethodrefClassName(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 484
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    .line 486
    .local v0, "minfo":Ljavassist/bytecode/InterfaceMethodrefInfo;
    iget v1, v0, Ljavassist/bytecode/InterfaceMethodrefInfo;->classIndex:I

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getInterfaceMethodrefName(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 510
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    .line 512
    .local v0, "minfo":Ljavassist/bytecode/InterfaceMethodrefInfo;
    if-nez v0, :cond_a

    .line 520
    :cond_9
    :goto_9
    return-object v2

    .line 515
    :cond_a
    iget v3, v0, Ljavassist/bytecode/InterfaceMethodrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 517
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 520
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method public getInterfaceMethodrefNameAndType(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 495
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    .line 497
    .local v0, "minfo":Ljavassist/bytecode/InterfaceMethodrefInfo;
    iget v1, v0, Ljavassist/bytecode/InterfaceMethodrefInfo;->nameAndTypeIndex:I

    return v1
.end method

.method public getInterfaceMethodrefType(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 534
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InterfaceMethodrefInfo;

    .line 536
    .local v0, "minfo":Ljavassist/bytecode/InterfaceMethodrefInfo;
    if-nez v0, :cond_a

    .line 544
    :cond_9
    :goto_9
    return-object v2

    .line 539
    :cond_a
    iget v3, v0, Ljavassist/bytecode/InterfaceMethodrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 541
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 544
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method public getInvokeDynamicBootstrap(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 694
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InvokeDynamicInfo;

    .line 695
    .local v0, "iv":Ljavassist/bytecode/InvokeDynamicInfo;
    iget v1, v0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    return v1
.end method

.method public getInvokeDynamicNameAndType(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 706
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InvokeDynamicInfo;

    .line 707
    .local v0, "iv":Ljavassist/bytecode/InvokeDynamicInfo;
    iget v1, v0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    return v1
.end method

.method public getInvokeDynamicType(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 720
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/InvokeDynamicInfo;

    .line 721
    .local v0, "iv":Ljavassist/bytecode/InvokeDynamicInfo;
    if-nez v0, :cond_a

    .line 728
    :cond_9
    :goto_9
    return-object v2

    .line 724
    :cond_a
    iget v3, v0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 725
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 728
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method getItem(I)Ljavassist/bytecode/ConstInfo;
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 209
    iget-object v0, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    return-object v0
.end method

.method public getLdcValue(I)Ljava/lang/Object;
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 557
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    .line 558
    .local v0, "constInfo":Ljavassist/bytecode/ConstInfo;
    const/4 v1, 0x0

    .line 559
    .local v1, "value":Ljava/lang/Object;
    instance-of v2, v0, Ljavassist/bytecode/StringInfo;

    if-eqz v2, :cond_e

    .line 560
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getStringInfo(I)Ljava/lang/String;

    move-result-object v1

    .line 572
    .end local v1    # "value":Ljava/lang/Object;
    :goto_d
    return-object v1

    .line 561
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_e
    instance-of v2, v0, Ljavassist/bytecode/FloatInfo;

    if-eqz v2, :cond_1c

    .line 562
    new-instance v1, Ljava/lang/Float;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getFloatInfo(I)F

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/Float;-><init>(F)V

    .local v1, "value":Ljava/lang/Float;
    goto :goto_d

    .line 563
    .local v1, "value":Ljava/lang/Object;
    :cond_1c
    instance-of v2, v0, Ljavassist/bytecode/IntegerInfo;

    if-eqz v2, :cond_2a

    .line 564
    new-instance v1, Ljava/lang/Integer;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getIntegerInfo(I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    .local v1, "value":Ljava/lang/Integer;
    goto :goto_d

    .line 565
    .local v1, "value":Ljava/lang/Object;
    :cond_2a
    instance-of v2, v0, Ljavassist/bytecode/LongInfo;

    if-eqz v2, :cond_38

    .line 566
    new-instance v1, Ljava/lang/Long;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getLongInfo(I)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    .local v1, "value":Ljava/lang/Long;
    goto :goto_d

    .line 567
    .local v1, "value":Ljava/lang/Object;
    :cond_38
    instance-of v2, v0, Ljavassist/bytecode/DoubleInfo;

    if-eqz v2, :cond_46

    .line 568
    new-instance v1, Ljava/lang/Double;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getDoubleInfo(I)D

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/lang/Double;-><init>(D)V

    .local v1, "value":Ljava/lang/Double;
    goto :goto_d

    .line 570
    .local v1, "value":Ljava/lang/Object;
    :cond_46
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public getLongInfo(I)J
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 604
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/LongInfo;

    .line 605
    .local v0, "i":Ljavassist/bytecode/LongInfo;
    iget-wide v1, v0, Ljavassist/bytecode/LongInfo;->value:J

    return-wide v1
.end method

.method public getMemberClass(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 291
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MemberrefInfo;

    .line 292
    .local v0, "minfo":Ljavassist/bytecode/MemberrefInfo;
    iget v1, v0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    return v1
.end method

.method public getMemberNameAndType(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 305
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MemberrefInfo;

    .line 306
    .local v0, "minfo":Ljavassist/bytecode/MemberrefInfo;
    iget v1, v0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    return v1
.end method

.method public getMethodHandleIndex(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 670
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodHandleInfo;

    .line 671
    .local v0, "mhinfo":Ljavassist/bytecode/MethodHandleInfo;
    iget v1, v0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    return v1
.end method

.method public getMethodHandleKind(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 658
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodHandleInfo;

    .line 659
    .local v0, "mhinfo":Ljavassist/bytecode/MethodHandleInfo;
    iget v1, v0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    return v1
.end method

.method public getMethodTypeInfo(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 682
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodTypeInfo;

    .line 683
    .local v0, "mtinfo":Ljavassist/bytecode/MethodTypeInfo;
    iget v1, v0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    return v1
.end method

.method public getMethodrefClass(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 392
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodrefInfo;

    .line 393
    .local v0, "minfo":Ljavassist/bytecode/MethodrefInfo;
    iget v1, v0, Ljavassist/bytecode/MethodrefInfo;->classIndex:I

    return v1
.end method

.method public getMethodrefClassName(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 404
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodrefInfo;

    .line 405
    .local v0, "minfo":Ljavassist/bytecode/MethodrefInfo;
    if-nez v0, :cond_a

    .line 406
    const/4 v1, 0x0

    .line 408
    :goto_9
    return-object v1

    :cond_a
    iget v1, v0, Ljavassist/bytecode/MethodrefInfo;->classIndex:I

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getMethodrefName(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 430
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodrefInfo;

    .line 431
    .local v0, "minfo":Ljavassist/bytecode/MethodrefInfo;
    if-nez v0, :cond_a

    .line 439
    :cond_9
    :goto_9
    return-object v2

    .line 434
    :cond_a
    iget v3, v0, Ljavassist/bytecode/MethodrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 436
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 439
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method public getMethodrefNameAndType(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 417
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodrefInfo;

    .line 418
    .local v0, "minfo":Ljavassist/bytecode/MethodrefInfo;
    iget v1, v0, Ljavassist/bytecode/MethodrefInfo;->nameAndTypeIndex:I

    return v1
.end method

.method public getMethodrefType(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 452
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MethodrefInfo;

    .line 453
    .local v0, "minfo":Ljavassist/bytecode/MethodrefInfo;
    if-nez v0, :cond_a

    .line 461
    :cond_9
    :goto_9
    return-object v2

    .line 456
    :cond_a
    iget v3, v0, Ljavassist/bytecode/MethodrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 458
    .local v1, "n":Ljavassist/bytecode/NameAndTypeInfo;
    if-eqz v1, :cond_9

    .line 461
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method public getNameAndTypeDescriptor(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 277
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/NameAndTypeInfo;

    .line 278
    .local v0, "ntinfo":Ljavassist/bytecode/NameAndTypeInfo;
    iget v1, v0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    return v1
.end method

.method public getNameAndTypeName(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 267
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/NameAndTypeInfo;

    .line 268
    .local v0, "ntinfo":Ljavassist/bytecode/NameAndTypeInfo;
    iget v1, v0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    return v1
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    return v0
.end method

.method public getStringInfo(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 626
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/StringInfo;

    .line 627
    .local v0, "si":Ljavassist/bytecode/StringInfo;
    iget v1, v0, Ljavassist/bytecode/StringInfo;->string:I

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getTag(I)I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/ConstInfo;->getTag()I

    move-result v0

    return v0
.end method

.method public getThisClassInfo()I
    .registers 2

    .prologue
    .line 201
    iget v0, p0, Ljavassist/bytecode/ConstPool;->thisClassInfo:I

    return v0
.end method

.method public getUtf8Info(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 637
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/Utf8Info;

    .line 638
    .local v0, "utf":Ljavassist/bytecode/Utf8Info;
    iget-object v1, v0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    return-object v1
.end method

.method public isConstructor(Ljava/lang/String;I)I
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 743
    const-string v0, "<init>"

    invoke-virtual {p0, p1, v0, p2}, Ljavassist/bytecode/ConstPool;->isMember(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isMember(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "membername"    # Ljava/lang/String;
    .param p3, "index"    # I

    .prologue
    .line 763
    invoke-virtual {p0, p3}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/MemberrefInfo;

    .line 764
    .local v0, "minfo":Ljavassist/bytecode/MemberrefInfo;
    iget v2, v0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 765
    iget v2, v0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/NameAndTypeInfo;

    .line 767
    .local v1, "ntinfo":Ljavassist/bytecode/NameAndTypeInfo;
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 768
    iget v2, v1, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 771
    .end local v1    # "ntinfo":Ljavassist/bytecode/NameAndTypeInfo;
    :goto_28
    return v2

    :cond_29
    const/4 v2, 0x0

    goto :goto_28
.end method

.method public print()V
    .registers 4

    .prologue
    .line 1258
    new-instance v0, Ljava/io/PrintWriter;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ConstPool;->print(Ljava/io/PrintWriter;)V

    .line 1259
    return-void
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 5
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1265
    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 1266
    .local v1, "size":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_3
    if-ge v0, v1, :cond_19

    .line 1267
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1268
    const-string v2, " "

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1269
    iget-object v2, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    invoke-virtual {v2, v0}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ConstInfo;->print(Ljava/io/PrintWriter;)V

    .line 1266
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 1271
    :cond_19
    return-void
.end method

.method prune()V
    .registers 2

    .prologue
    .line 179
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    .line 180
    return-void
.end method

.method public renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "oldName"    # Ljava/lang/String;
    .param p2, "newName"    # Ljava/lang/String;

    .prologue
    .line 1136
    iget-object v3, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    .line 1137
    .local v3, "v":Ljavassist/bytecode/LongVector;
    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 1138
    .local v2, "size":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_5
    if-ge v1, v2, :cond_13

    .line 1139
    invoke-virtual {v3, v1}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    .line 1140
    .local v0, "ci":Ljavassist/bytecode/ConstInfo;
    iget-object v4, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1, p2, v4}, Ljavassist/bytecode/ConstInfo;->renameClass(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 1138
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1142
    .end local v0    # "ci":Ljavassist/bytecode/ConstInfo;
    :cond_13
    return-void
.end method

.method public renameClass(Ljava/util/Map;)V
    .registers 7
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 1151
    iget-object v3, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    .line 1152
    .local v3, "v":Ljavassist/bytecode/LongVector;
    iget v2, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 1153
    .local v2, "size":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_5
    if-ge v1, v2, :cond_13

    .line 1154
    invoke-virtual {v3, v1}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v0

    .line 1155
    .local v0, "ci":Ljavassist/bytecode/ConstInfo;
    iget-object v4, p0, Ljavassist/bytecode/ConstPool;->itemsCache:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1, v4}, Ljavassist/bytecode/ConstInfo;->renameClass(Ljavassist/bytecode/ConstPool;Ljava/util/Map;Ljava/util/HashMap;)V

    .line 1153
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1157
    .end local v0    # "ci":Ljavassist/bytecode/ConstInfo;
    :cond_13
    return-void
.end method

.method setThisClassInfo(I)V
    .registers 2
    .param p1, "i"    # I

    .prologue
    .line 205
    iput p1, p0, Ljavassist/bytecode/ConstPool;->thisClassInfo:I

    .line 206
    return-void
.end method

.method public write(Ljava/io/DataOutputStream;)V
    .registers 6
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1247
    iget v3, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1248
    iget-object v2, p0, Ljavassist/bytecode/ConstPool;->items:Ljavassist/bytecode/LongVector;

    .line 1249
    .local v2, "v":Ljavassist/bytecode/LongVector;
    iget v1, p0, Ljavassist/bytecode/ConstPool;->numOfItems:I

    .line 1250
    .local v1, "size":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_16

    .line 1251
    invoke-virtual {v2, v0}, Ljavassist/bytecode/LongVector;->elementAt(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljavassist/bytecode/ConstInfo;->write(Ljava/io/DataOutputStream;)V

    .line 1250
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1252
    :cond_16
    return-void
.end method
