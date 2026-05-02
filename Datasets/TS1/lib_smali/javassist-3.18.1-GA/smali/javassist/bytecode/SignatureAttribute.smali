.class public Ljavassist/bytecode/SignatureAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/SignatureAttribute$1;,
        Ljavassist/bytecode/SignatureAttribute$TypeVariable;,
        Ljavassist/bytecode/SignatureAttribute$ArrayType;,
        Ljavassist/bytecode/SignatureAttribute$NestedClassType;,
        Ljavassist/bytecode/SignatureAttribute$ClassType;,
        Ljavassist/bytecode/SignatureAttribute$ObjectType;,
        Ljavassist/bytecode/SignatureAttribute$BaseType;,
        Ljavassist/bytecode/SignatureAttribute$Type;,
        Ljavassist/bytecode/SignatureAttribute$TypeArgument;,
        Ljavassist/bytecode/SignatureAttribute$TypeParameter;,
        Ljavassist/bytecode/SignatureAttribute$MethodSignature;,
        Ljavassist/bytecode/SignatureAttribute$ClassSignature;,
        Ljavassist/bytecode/SignatureAttribute$Cursor;
    }
.end annotation


# static fields
.field public static final tag:Ljava/lang/String; = "Signature"


# direct methods
.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "n"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 47
    const-string v2, "Signature"

    invoke-direct {p0, p1, v2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 48
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    .line 49
    .local v1, "index":I
    const/4 v2, 0x2

    new-array v0, v2, [B

    .line 50
    .local v0, "bvalue":[B
    const/4 v2, 0x0

    ushr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 51
    const/4 v2, 0x1

    int-to-byte v3, v1

    aput-byte v3, v0, v2

    .line 52
    invoke-virtual {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->set([B)V

    .line 53
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v0

    return-object v0
.end method

.method private static error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;
    .registers 4
    .param p0, "sig"    # Ljava/lang/String;

    .prologue
    .line 1133
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad signature: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static isNamePart(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 157
    const/16 v0, 0x3b

    if-eq p0, v0, :cond_a

    const/16 v0, 0x3c

    if-eq p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static parseArray(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 5
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "c"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1117
    const/4 v0, 0x1

    .line 1118
    .local v0, "dim":I
    :goto_1
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_12

    .line 1119
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1121
    :cond_12
    new-instance v1, Ljavassist/bytecode/SignatureAttribute$ArrayType;

    invoke-static {p0, p1}, Ljavassist/bytecode/SignatureAttribute;->parseType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$Type;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljavassist/bytecode/SignatureAttribute$ArrayType;-><init>(ILjavassist/bytecode/SignatureAttribute$Type;)V

    return-object v1
.end method

.method private static parseClassType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 4
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "c"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1062
    iget v0, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x4c

    if-ne v0, v1, :cond_10

    .line 1063
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Ljavassist/bytecode/SignatureAttribute;->parseClassType2(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Ljavassist/bytecode/SignatureAttribute$ClassType;)Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v0

    return-object v0

    .line 1065
    :cond_10
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v0

    throw v0
.end method

.method private static parseClassType2(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Ljavassist/bytecode/SignatureAttribute$ClassType;)Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 12
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "c"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .param p2, "parent"    # Ljavassist/bytecode/SignatureAttribute$ClassType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/16 v8, 0x3c

    const/16 v7, 0x24

    .line 1071
    iget v5, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v1, v5, 0x1

    iput v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1074
    .local v1, "start":I
    :cond_a
    iget v5, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1075
    .local v2, "t":C
    if-eq v2, v7, :cond_1c

    if-eq v2, v8, :cond_1c

    const/16 v5, 0x3b

    if-ne v2, v5, :cond_a

    .line 1076
    :cond_1c
    iget v5, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v0, v5, -0x1

    .line 1078
    .local v0, "end":I
    if-ne v2, v8, :cond_45

    .line 1079
    invoke-static {p0, p1}, Ljavassist/bytecode/SignatureAttribute;->parseTypeArgs(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    move-result-object v3

    .line 1080
    .local v3, "targs":[Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    iget v5, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1085
    :goto_30
    invoke-static {p0, v1, v0, v3, p2}, Ljavassist/bytecode/SignatureAttribute$ClassType;->make(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;Ljavassist/bytecode/SignatureAttribute$ClassType;)Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v4

    .line 1086
    .local v4, "thisClass":Ljavassist/bytecode/SignatureAttribute$ClassType;
    if-eq v2, v7, :cond_3a

    const/16 v5, 0x2e

    if-ne v2, v5, :cond_44

    .line 1087
    :cond_3a
    iget v5, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1088
    invoke-static {p0, p1, v4}, Ljavassist/bytecode/SignatureAttribute;->parseClassType2(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Ljavassist/bytecode/SignatureAttribute$ClassType;)Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v4

    .line 1091
    .end local v4    # "thisClass":Ljavassist/bytecode/SignatureAttribute$ClassType;
    :cond_44
    return-object v4

    .line 1083
    .end local v3    # "targs":[Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    :cond_45
    const/4 v3, 0x0

    .restart local v3    # "targs":[Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    goto :goto_30
.end method

.method private static parseMethodSig(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$MethodSignature;
    .registers 12
    .param p0, "sig"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 981
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$Cursor;

    const/4 v9, 0x0

    invoke-direct {v0, v9}, Ljavassist/bytecode/SignatureAttribute$Cursor;-><init>(Ljavassist/bytecode/SignatureAttribute$1;)V

    .line 982
    .local v0, "cur":Ljavassist/bytecode/SignatureAttribute$Cursor;
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->parseTypeParams(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    move-result-object v8

    .line 983
    .local v8, "tp":[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    iget v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x28

    if-eq v9, v10, :cond_1d

    .line 984
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v9

    throw v9

    .line 986
    :cond_1d
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 987
    .local v4, "params":Ljava/util/ArrayList;
    :goto_22
    iget v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x29

    if-eq v9, v10, :cond_34

    .line 988
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->parseType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$Type;

    move-result-object v7

    .line 989
    .local v7, "t":Ljavassist/bytecode/SignatureAttribute$Type;
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 992
    .end local v7    # "t":Ljavassist/bytecode/SignatureAttribute$Type;
    :cond_34
    iget v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v9, v9, 0x1

    iput v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 993
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->parseType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$Type;

    move-result-object v5

    .line 994
    .local v5, "ret":Ljavassist/bytecode/SignatureAttribute$Type;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 995
    .local v6, "sigLen":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 996
    .local v2, "exceptions":Ljava/util/ArrayList;
    :goto_47
    iget v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    if-ge v9, v6, :cond_6d

    iget v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x5e

    if-ne v9, v10, :cond_6d

    .line 997
    iget v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v9, v9, 0x1

    iput v9, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 998
    const/4 v9, 0x0

    invoke-static {p0, v0, v9}, Ljavassist/bytecode/SignatureAttribute;->parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v7

    .line 999
    .local v7, "t":Ljavassist/bytecode/SignatureAttribute$ObjectType;
    instance-of v9, v7, Ljavassist/bytecode/SignatureAttribute$ArrayType;

    if-eqz v9, :cond_69

    .line 1000
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v9

    throw v9

    .line 1002
    :cond_69
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_47

    .line 1005
    .end local v7    # "t":Ljavassist/bytecode/SignatureAttribute$ObjectType;
    :cond_6d
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    new-array v9, v9, [Ljavassist/bytecode/SignatureAttribute$Type;

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljavassist/bytecode/SignatureAttribute$Type;

    move-object v3, v9

    check-cast v3, [Ljavassist/bytecode/SignatureAttribute$Type;

    .line 1006
    .local v3, "p":[Ljavassist/bytecode/SignatureAttribute$Type;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    new-array v9, v9, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-object v1, v9

    check-cast v1, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 1007
    .local v1, "ex":[Ljavassist/bytecode/SignatureAttribute$ObjectType;
    new-instance v9, Ljavassist/bytecode/SignatureAttribute$MethodSignature;

    invoke-direct {v9, v8, v3, v5, v1}, Ljavassist/bytecode/SignatureAttribute$MethodSignature;-><init>([Ljavassist/bytecode/SignatureAttribute$TypeParameter;[Ljavassist/bytecode/SignatureAttribute$Type;Ljavassist/bytecode/SignatureAttribute$Type;[Ljavassist/bytecode/SignatureAttribute$ObjectType;)V

    return-object v9
.end method

.method private static parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 7
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "c"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .param p2, "dontThrow"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1042
    iget v0, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1043
    .local v0, "begin":I
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_2a

    .line 1052
    if-eqz p2, :cond_25

    .line 1053
    :goto_c
    return-object v2

    .line 1045
    :sswitch_d
    invoke-static {p0, p1, v2}, Ljavassist/bytecode/SignatureAttribute;->parseClassType2(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Ljavassist/bytecode/SignatureAttribute$ClassType;)Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v2

    goto :goto_c

    .line 1047
    :sswitch_12
    const/16 v2, 0x3b

    invoke-virtual {p1, p0, v2}, Ljavassist/bytecode/SignatureAttribute$Cursor;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1048
    .local v1, "i":I
    new-instance v2, Ljavassist/bytecode/SignatureAttribute$TypeVariable;

    add-int/lit8 v3, v0, 0x1

    invoke-direct {v2, p0, v3, v1}, Ljavassist/bytecode/SignatureAttribute$TypeVariable;-><init>(Ljava/lang/String;II)V

    goto :goto_c

    .line 1050
    .end local v1    # "i":I
    :sswitch_20
    invoke-static {p0, p1}, Ljavassist/bytecode/SignatureAttribute;->parseArray(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v2

    goto :goto_c

    .line 1055
    :cond_25
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v2

    throw v2

    .line 1043
    :sswitch_data_2a
    .sparse-switch
        0x4c -> :sswitch_d
        0x54 -> :sswitch_12
        0x5b -> :sswitch_20
    .end sparse-switch
.end method

.method private static parseSig(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$ClassSignature;
    .registers 9
    .param p0, "sig"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;,
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 965
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$Cursor;

    const/4 v6, 0x0

    invoke-direct {v0, v6}, Ljavassist/bytecode/SignatureAttribute$Cursor;-><init>(Ljavassist/bytecode/SignatureAttribute$1;)V

    .line 966
    .local v0, "cur":Ljavassist/bytecode/SignatureAttribute$Cursor;
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->parseTypeParams(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    move-result-object v5

    .line 967
    .local v5, "tp":[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->parseClassType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v4

    .line 968
    .local v4, "superClass":Ljavassist/bytecode/SignatureAttribute$ClassType;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 969
    .local v3, "sigLen":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 970
    .local v1, "ifArray":Ljava/util/ArrayList;
    :goto_17
    iget v6, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    if-ge v6, v3, :cond_2d

    iget v6, v0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x4c

    if-ne v6, v7, :cond_2d

    .line 971
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->parseClassType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 973
    :cond_2d
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljavassist/bytecode/SignatureAttribute$ClassType;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-object v2, v6

    check-cast v2, [Ljavassist/bytecode/SignatureAttribute$ClassType;

    .line 975
    .local v2, "ifs":[Ljavassist/bytecode/SignatureAttribute$ClassType;
    new-instance v6, Ljavassist/bytecode/SignatureAttribute$ClassSignature;

    invoke-direct {v6, v5, v4, v2}, Ljavassist/bytecode/SignatureAttribute$ClassSignature;-><init>([Ljavassist/bytecode/SignatureAttribute$TypeParameter;Ljavassist/bytecode/SignatureAttribute$ClassType;[Ljavassist/bytecode/SignatureAttribute$ClassType;)V

    return-object v6
.end method

.method private static parseType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$Type;
    .registers 5
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "c"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1125
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Ljavassist/bytecode/SignatureAttribute;->parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v0

    .line 1126
    .local v0, "t":Ljavassist/bytecode/SignatureAttribute$Type;
    if-nez v0, :cond_16

    .line 1127
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$BaseType;

    .end local v0    # "t":Ljavassist/bytecode/SignatureAttribute$Type;
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/SignatureAttribute$BaseType;-><init>(C)V

    .line 1129
    .restart local v0    # "t":Ljavassist/bytecode/SignatureAttribute$Type;
    :cond_16
    return-object v0
.end method

.method private static parseTypeArgs(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)[Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    .registers 8
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "c"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2a

    .line 1095
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1097
    .local v0, "args":Ljava/util/ArrayList;
    :goto_7
    iget v3, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .local v1, "t":C
    const/16 v3, 0x3e

    if-eq v1, v3, :cond_3c

    .line 1099
    if-ne v1, v5, :cond_21

    .line 1100
    new-instance v2, Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v5}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;-><init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V

    .line 1110
    .local v2, "ta":Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    :goto_1d
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 1102
    .end local v2    # "ta":Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    :cond_21
    const/16 v3, 0x2b

    if-eq v1, v3, :cond_31

    const/16 v3, 0x2d

    if-eq v1, v3, :cond_31

    .line 1103
    const/16 v1, 0x20

    .line 1104
    iget v3, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1107
    :cond_31
    new-instance v2, Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    const/4 v3, 0x0

    invoke-static {p0, p1, v3}, Ljavassist/bytecode/SignatureAttribute;->parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;-><init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V

    .restart local v2    # "ta":Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    goto :goto_1d

    .line 1113
    .end local v2    # "ta":Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    :cond_3c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    check-cast v3, [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    return-object v3
.end method

.method private static parseTypeParams(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    .registers 12
    .param p0, "sig"    # Ljava/lang/String;
    .param p1, "cur"    # Ljavassist/bytecode/SignatureAttribute$Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/16 v9, 0x3a

    .line 1013
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1014
    .local v8, "typeParam":Ljava/util/ArrayList;
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v5, 0x3c

    if-ne v1, v5, :cond_67

    .line 1015
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1016
    :goto_17
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v5, 0x3e

    if-eq v1, v5, :cond_61

    .line 1017
    iget v2, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1018
    .local v2, "nameBegin":I
    invoke-virtual {p1, p0, v9}, Ljavassist/bytecode/SignatureAttribute$Cursor;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 1019
    .local v3, "nameEnd":I
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Ljavassist/bytecode/SignatureAttribute;->parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v4

    .line 1020
    .local v4, "classBound":Ljavassist/bytecode/SignatureAttribute$ObjectType;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1021
    .local v6, "ifBound":Ljava/util/ArrayList;
    :goto_31
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v9, :cond_48

    .line 1022
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1023
    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Ljavassist/bytecode/SignatureAttribute;->parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v7

    .line 1024
    .local v7, "t":Ljavassist/bytecode/SignatureAttribute$ObjectType;
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 1027
    .end local v7    # "t":Ljavassist/bytecode/SignatureAttribute$ObjectType;
    :cond_48
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-object v5, v1

    check-cast v5, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;-><init>(Ljava/lang/String;IILjavassist/bytecode/SignatureAttribute$ObjectType;[Ljavassist/bytecode/SignatureAttribute$ObjectType;)V

    .line 1029
    .local v0, "p":Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 1032
    .end local v0    # "p":Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    .end local v2    # "nameBegin":I
    .end local v3    # "nameEnd":I
    .end local v4    # "classBound":Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .end local v6    # "ifBound":Ljava/util/ArrayList;
    :cond_61
    iget v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 1035
    :cond_67
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    check-cast v1, [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    return-object v1
.end method

.method static renameClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "desc"    # Ljava/lang/String;
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 102
    .local v0, "map":Ljava/util/Map;
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-static {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->renameClass(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static renameClass(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 15
    .param p0, "desc"    # Ljava/lang/String;
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    const/16 v12, 0x4c

    .line 107
    if-nez p1, :cond_5

    .line 152
    .end local p0    # "desc":Ljava/lang/String;
    :cond_4
    :goto_4
    return-object p0

    .line 110
    .restart local p0    # "desc":Ljava/lang/String;
    :cond_5
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .local v10, "newdesc":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 112
    .local v2, "head":I
    const/4 v3, 0x0

    .line 114
    .local v3, "i":I
    :cond_c
    :goto_c
    invoke-virtual {p0, v12, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 115
    .local v4, "j":I
    if-gez v4, :cond_26

    .line 145
    :goto_12
    if-eqz v2, :cond_4

    .line 148
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 149
    .local v6, "len":I
    if-ge v2, v6, :cond_21

    .line 150
    invoke-virtual {p0, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    :cond_21
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 118
    .end local v6    # "len":I
    :cond_26
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .local v9, "nameBuf":Ljava/lang/StringBuilder;
    move v5, v4

    .line 122
    .local v5, "k":I
    :cond_2c
    :goto_2c
    add-int/lit8 v5, v5, 0x1

    :try_start_2e
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":C
    const/16 v11, 0x3b

    if-eq v0, v11, :cond_51

    .line 123
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 124
    const/16 v11, 0x3c

    if-ne v0, v11, :cond_2c

    .line 125
    :goto_3d
    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v11, 0x3e

    if-eq v0, v11, :cond_4d

    .line 126
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3d

    .line 132
    .end local v0    # "c":C
    :catch_4b
    move-exception v1

    .local v1, "e":Ljava/lang/IndexOutOfBoundsException;
    goto :goto_12

    .line 128
    .end local v1    # "e":Ljava/lang/IndexOutOfBoundsException;
    .restart local v0    # "c":C
    :cond_4d
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_50
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2e .. :try_end_50} :catch_4b

    goto :goto_2c

    .line 133
    :cond_51
    add-int/lit8 v3, v5, 0x1

    .line 134
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 135
    .local v7, "name":Ljava/lang/String;
    invoke-interface {p1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 136
    .local v8, "name2":Ljava/lang/String;
    if-eqz v8, :cond_c

    .line 137
    invoke-virtual {p0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    move v2, v3

    goto :goto_c
.end method

.method public static toClassSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$ClassSignature;
    .registers 3
    .param p0, "sig"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 899
    :try_start_0
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->parseSig(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$ClassSignature;
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 901
    :catch_5
    move-exception v0

    .line 902
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v1

    throw v1
.end method

.method public static toFieldSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 4
    .param p0, "sig"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 938
    :try_start_0
    new-instance v1, Ljavassist/bytecode/SignatureAttribute$Cursor;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljavassist/bytecode/SignatureAttribute$Cursor;-><init>(Ljavassist/bytecode/SignatureAttribute$1;)V

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Ljavassist/bytecode/SignatureAttribute;->parseObjectType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;Z)Ljavassist/bytecode/SignatureAttribute$ObjectType;
    :try_end_a
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_a} :catch_c

    move-result-object v1

    return-object v1

    .line 940
    :catch_c
    move-exception v0

    .line 941
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v1

    throw v1
.end method

.method public static toMethodSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$MethodSignature;
    .registers 3
    .param p0, "sig"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 919
    :try_start_0
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->parseMethodSig(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$MethodSignature;
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 921
    :catch_5
    move-exception v0

    .line 922
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v1

    throw v1
.end method

.method public static toTypeSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$Type;
    .registers 4
    .param p0, "sig"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 955
    :try_start_0
    new-instance v1, Ljavassist/bytecode/SignatureAttribute$Cursor;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljavassist/bytecode/SignatureAttribute$Cursor;-><init>(Ljavassist/bytecode/SignatureAttribute$1;)V

    invoke-static {p0, v1}, Ljavassist/bytecode/SignatureAttribute;->parseType(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$Cursor;)Ljavassist/bytecode/SignatureAttribute$Type;
    :try_end_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 957
    :catch_b
    move-exception v0

    .line 958
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    invoke-static {p0}, Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 5
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 87
    new-instance v0, Ljavassist/bytecode/SignatureAttribute;

    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/SignatureAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 4

    .prologue
    .line 63
    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute;->get()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1, p2}, Ljavassist/bytecode/SignatureAttribute;->renameClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "sig":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->setSignature(Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method renameClass(Ljava/util/Map;)V
    .registers 4
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 96
    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Ljavassist/bytecode/SignatureAttribute;->renameClass(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "sig":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljavassist/bytecode/SignatureAttribute;->setSignature(Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public setSignature(Ljava/lang/String;)V
    .registers 5
    .param p1, "sig"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    .line 75
    .local v0, "index":I
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute;->info:[B

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 76
    return-void
.end method
