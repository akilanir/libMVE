.class public interface abstract Ljavassist/compiler/TokenId;
.super Ljava/lang/Object;
.source "TokenId.java"


# static fields
.field public static final ABSTRACT:I = 0x12c

.field public static final ANDAND:I = 0x171

.field public static final AND_E:I = 0x160

.field public static final ARRAY:I = 0x41

.field public static final ARSHIFT:I = 0x172

.field public static final ARSHIFT_E:I = 0x173

.field public static final BLOCK:I = 0x42

.field public static final BOOLEAN:I = 0x12d

.field public static final BREAK:I = 0x12e

.field public static final BYTE:I = 0x12f

.field public static final BadToken:I = 0x1f4

.field public static final CALL:I = 0x43

.field public static final CASE:I = 0x130

.field public static final CATCH:I = 0x131

.field public static final CHAR:I = 0x132

.field public static final CLASS:I = 0x133

.field public static final CONST:I = 0x134

.field public static final CONTINUE:I = 0x135

.field public static final CharConstant:I = 0x191

.field public static final DECL:I = 0x44

.field public static final DEFAULT:I = 0x136

.field public static final DIV_E:I = 0x164

.field public static final DO:I = 0x137

.field public static final DOUBLE:I = 0x138

.field public static final DoubleConstant:I = 0x195

.field public static final ELSE:I = 0x139

.field public static final EQ:I = 0x166

.field public static final EXOR_E:I = 0x168

.field public static final EXPR:I = 0x45

.field public static final EXTENDS:I = 0x13a

.field public static final FALSE:I = 0x19b

.field public static final FINAL:I = 0x13b

.field public static final FINALLY:I = 0x13c

.field public static final FLOAT:I = 0x13d

.field public static final FOR:I = 0x13e

.field public static final FloatConstant:I = 0x194

.field public static final GE:I = 0x167

.field public static final GOTO:I = 0x13f

.field public static final IF:I = 0x140

.field public static final IMPLEMENTS:I = 0x141

.field public static final IMPORT:I = 0x142

.field public static final INSTANCEOF:I = 0x143

.field public static final INT:I = 0x144

.field public static final INTERFACE:I = 0x145

.field public static final Identifier:I = 0x190

.field public static final IntConstant:I = 0x192

.field public static final LABEL:I = 0x4c

.field public static final LE:I = 0x165

.field public static final LONG:I = 0x146

.field public static final LSHIFT:I = 0x16c

.field public static final LSHIFT_E:I = 0x16d

.field public static final LongConstant:I = 0x193

.field public static final MEMBER:I = 0x23

.field public static final MINUSMINUS:I = 0x16b

.field public static final MINUS_E:I = 0x163

.field public static final MOD_E:I = 0x15f

.field public static final MUL_E:I = 0x161

.field public static final NATIVE:I = 0x147

.field public static final NEQ:I = 0x15e

.field public static final NEW:I = 0x148

.field public static final NULL:I = 0x19c

.field public static final OROR:I = 0x170

.field public static final OR_E:I = 0x169

.field public static final PACKAGE:I = 0x149

.field public static final PLUSPLUS:I = 0x16a

.field public static final PLUS_E:I = 0x162

.field public static final PRIVATE:I = 0x14a

.field public static final PROTECTED:I = 0x14b

.field public static final PUBLIC:I = 0x14c

.field public static final RETURN:I = 0x14d

.field public static final RSHIFT:I = 0x16e

.field public static final RSHIFT_E:I = 0x16f

.field public static final SHORT:I = 0x14e

.field public static final STATIC:I = 0x14f

.field public static final STRICT:I = 0x15b

.field public static final SUPER:I = 0x150

.field public static final SWITCH:I = 0x151

.field public static final SYNCHRONIZED:I = 0x152

.field public static final StringL:I = 0x196

.field public static final THIS:I = 0x153

.field public static final THROW:I = 0x154

.field public static final THROWS:I = 0x155

.field public static final TRANSIENT:I = 0x156

.field public static final TRUE:I = 0x19a

.field public static final TRY:I = 0x157

.field public static final VOID:I = 0x158

.field public static final VOLATILE:I = 0x159

.field public static final WHILE:I = 0x15a

.field public static final assignOps:[I

.field public static final opNames:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/16 v3, 0x15

    .line 93
    const/16 v0, 0x16

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "!="

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "%="

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "&="

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "*="

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "+="

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "-="

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "/="

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "<="

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "=="

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, ">="

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "^="

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "|="

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "++"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "--"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "<<"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "<<="

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, ">>"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, ">>="

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "||"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "&&"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, ">>>"

    aput-object v2, v0, v1

    const-string v1, ">>>="

    aput-object v1, v0, v3

    sput-object v0, Ljavassist/compiler/TokenId;->opNames:[Ljava/lang/String;

    .line 99
    new-array v0, v3, [I

    fill-array-data v0, :array_8a

    sput-object v0, Ljavassist/compiler/TokenId;->assignOps:[I

    return-void

    :array_8a
    .array-data 4
        0x25
        0x26
        0x2a
        0x2b
        0x2d
        0x2f
        0x0
        0x0
        0x0
        0x5e
        0x7c
        0x0
        0x0
        0x0
        0x16c
        0x0
        0x16e
        0x0
        0x0
        0x0
        0x172
    .end array-data
.end method
