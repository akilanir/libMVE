.class Lcom/wutka/dtd/Scanner;
.super Ljava/lang/Object;
.source "Scanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wutka/dtd/Scanner$StreamInfo;
    }
.end annotation


# static fields
.field public static final ASTERISK:Lcom/wutka/dtd/TokenType;

.field public static final COMMA:Lcom/wutka/dtd/TokenType;

.field public static final COMMENT:Lcom/wutka/dtd/TokenType;

.field public static final CONDITIONAL:Lcom/wutka/dtd/TokenType;

.field public static final ENDCONDITIONAL:Lcom/wutka/dtd/TokenType;

.field public static final EOF:Lcom/wutka/dtd/TokenType;

.field public static final EQUAL:Lcom/wutka/dtd/TokenType;

.field public static final GT:Lcom/wutka/dtd/TokenType;

.field public static final IDENTIFIER:Lcom/wutka/dtd/TokenType;

.field public static final LPAREN:Lcom/wutka/dtd/TokenType;

.field public static final LT:Lcom/wutka/dtd/TokenType;

.field public static final LTBANG:Lcom/wutka/dtd/TokenType;

.field public static final LTQUES:Lcom/wutka/dtd/TokenType;

.field public static final NMTOKEN:Lcom/wutka/dtd/TokenType;

.field public static final PERCENT:Lcom/wutka/dtd/TokenType;

.field public static final PIPE:Lcom/wutka/dtd/TokenType;

.field public static final PLUS:Lcom/wutka/dtd/TokenType;

.field public static final QUES:Lcom/wutka/dtd/TokenType;

.field public static final QUESGT:Lcom/wutka/dtd/TokenType;

.field public static final RPAREN:Lcom/wutka/dtd/TokenType;

.field public static final STRING:Lcom/wutka/dtd/TokenType;

.field public static letterRanges:[[C


# instance fields
.field protected atEOF:Z

.field protected entityExpansion:Ljava/util/Hashtable;

.field protected expandBuffer:[C

.field protected expandPos:I

.field protected expander:Lcom/wutka/dtd/EntityExpansion;

.field protected in:Lcom/wutka/dtd/Scanner$StreamInfo;

.field protected inputStreams:Ljava/util/Stack;

.field protected nextChar:I

.field protected nextToken:Lcom/wutka/dtd/Token;

.field protected trace:Z


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x2

    .line 14
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const-string v1, "LTQUES"

    invoke-direct {v0, v4, v1}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->LTQUES:Lcom/wutka/dtd/TokenType;

    .line 15
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const-string v1, "IDENTIFIER"

    invoke-direct {v0, v5, v1}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    .line 16
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const-string v1, "EQUAL"

    invoke-direct {v0, v3, v1}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->EQUAL:Lcom/wutka/dtd/TokenType;

    .line 17
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const-string v1, "LPAREN"

    invoke-direct {v0, v6, v1}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    .line 18
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const-string v1, "RPAREN"

    invoke-direct {v0, v7, v1}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->RPAREN:Lcom/wutka/dtd/TokenType;

    .line 19
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/4 v1, 0x5

    const-string v2, "COMMA"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->COMMA:Lcom/wutka/dtd/TokenType;

    .line 20
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/4 v1, 0x6

    const-string v2, "STRING"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    .line 21
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/4 v1, 0x7

    const-string v2, "QUESGT"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->QUESGT:Lcom/wutka/dtd/TokenType;

    .line 22
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x8

    const-string v2, "LTBANG"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->LTBANG:Lcom/wutka/dtd/TokenType;

    .line 23
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x9

    const-string v2, "GT"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    .line 24
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0xa

    const-string v2, "PIPE"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    .line 25
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0xb

    const-string v2, "QUES"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->QUES:Lcom/wutka/dtd/TokenType;

    .line 26
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0xc

    const-string v2, "PLUS"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->PLUS:Lcom/wutka/dtd/TokenType;

    .line 27
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0xd

    const-string v2, "ASTERISK"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->ASTERISK:Lcom/wutka/dtd/TokenType;

    .line 28
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0xe

    const-string v2, "LT"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->LT:Lcom/wutka/dtd/TokenType;

    .line 29
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0xf

    const-string v2, "EOF"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->EOF:Lcom/wutka/dtd/TokenType;

    .line 30
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x10

    const-string v2, "COMMENT"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->COMMENT:Lcom/wutka/dtd/TokenType;

    .line 31
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x11

    const-string v2, "PERCENT"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->PERCENT:Lcom/wutka/dtd/TokenType;

    .line 32
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x12

    const-string v2, "CONDITIONAL"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->CONDITIONAL:Lcom/wutka/dtd/TokenType;

    .line 34
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x13

    const-string v2, "ENDCONDITIONAL"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->ENDCONDITIONAL:Lcom/wutka/dtd/TokenType;

    .line 36
    new-instance v0, Lcom/wutka/dtd/TokenType;

    const/16 v1, 0x14

    const-string v2, "NMTOKEN"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/TokenType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/Scanner;->NMTOKEN:Lcom/wutka/dtd/TokenType;

    .line 830
    const/16 v0, 0xca

    new-array v0, v0, [[C

    new-array v1, v3, [C

    fill-array-data v1, :array_7f4

    aput-object v1, v0, v4

    new-array v1, v3, [C

    fill-array-data v1, :array_7fa

    aput-object v1, v0, v5

    new-array v1, v3, [C

    fill-array-data v1, :array_800

    aput-object v1, v0, v3

    new-array v1, v3, [C

    fill-array-data v1, :array_806

    aput-object v1, v0, v6

    new-array v1, v3, [C

    fill-array-data v1, :array_80c

    aput-object v1, v0, v7

    const/4 v1, 0x5

    new-array v2, v3, [C

    fill-array-data v2, :array_812

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v3, [C

    fill-array-data v2, :array_818

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v3, [C

    fill-array-data v2, :array_81e

    aput-object v2, v0, v1

    const/16 v1, 0x8

    new-array v2, v3, [C

    fill-array-data v2, :array_824

    aput-object v2, v0, v1

    const/16 v1, 0x9

    new-array v2, v3, [C

    fill-array-data v2, :array_82a

    aput-object v2, v0, v1

    const/16 v1, 0xa

    new-array v2, v3, [C

    fill-array-data v2, :array_830

    aput-object v2, v0, v1

    const/16 v1, 0xb

    new-array v2, v3, [C

    fill-array-data v2, :array_836

    aput-object v2, v0, v1

    const/16 v1, 0xc

    new-array v2, v3, [C

    fill-array-data v2, :array_83c

    aput-object v2, v0, v1

    const/16 v1, 0xd

    new-array v2, v3, [C

    fill-array-data v2, :array_842

    aput-object v2, v0, v1

    const/16 v1, 0xe

    new-array v2, v3, [C

    fill-array-data v2, :array_848

    aput-object v2, v0, v1

    const/16 v1, 0xf

    new-array v2, v3, [C

    fill-array-data v2, :array_84e

    aput-object v2, v0, v1

    const/16 v1, 0x10

    new-array v2, v3, [C

    fill-array-data v2, :array_854

    aput-object v2, v0, v1

    const/16 v1, 0x11

    new-array v2, v3, [C

    fill-array-data v2, :array_85a

    aput-object v2, v0, v1

    const/16 v1, 0x12

    new-array v2, v3, [C

    fill-array-data v2, :array_860

    aput-object v2, v0, v1

    const/16 v1, 0x13

    new-array v2, v3, [C

    fill-array-data v2, :array_866

    aput-object v2, v0, v1

    const/16 v1, 0x14

    new-array v2, v3, [C

    fill-array-data v2, :array_86c

    aput-object v2, v0, v1

    const/16 v1, 0x15

    new-array v2, v3, [C

    fill-array-data v2, :array_872

    aput-object v2, v0, v1

    const/16 v1, 0x16

    new-array v2, v3, [C

    fill-array-data v2, :array_878

    aput-object v2, v0, v1

    const/16 v1, 0x17

    new-array v2, v3, [C

    fill-array-data v2, :array_87e

    aput-object v2, v0, v1

    const/16 v1, 0x18

    new-array v2, v3, [C

    fill-array-data v2, :array_884

    aput-object v2, v0, v1

    const/16 v1, 0x19

    new-array v2, v3, [C

    fill-array-data v2, :array_88a

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    new-array v2, v3, [C

    fill-array-data v2, :array_890

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    new-array v2, v3, [C

    fill-array-data v2, :array_896

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    new-array v2, v3, [C

    fill-array-data v2, :array_89c

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    new-array v2, v3, [C

    fill-array-data v2, :array_8a2

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    new-array v2, v3, [C

    fill-array-data v2, :array_8a8

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    new-array v2, v3, [C

    fill-array-data v2, :array_8ae

    aput-object v2, v0, v1

    const/16 v1, 0x20

    new-array v2, v3, [C

    fill-array-data v2, :array_8b4

    aput-object v2, v0, v1

    const/16 v1, 0x21

    new-array v2, v3, [C

    fill-array-data v2, :array_8ba

    aput-object v2, v0, v1

    const/16 v1, 0x22

    new-array v2, v3, [C

    fill-array-data v2, :array_8c0

    aput-object v2, v0, v1

    const/16 v1, 0x23

    new-array v2, v3, [C

    fill-array-data v2, :array_8c6

    aput-object v2, v0, v1

    const/16 v1, 0x24

    new-array v2, v3, [C

    fill-array-data v2, :array_8cc

    aput-object v2, v0, v1

    const/16 v1, 0x25

    new-array v2, v3, [C

    fill-array-data v2, :array_8d2

    aput-object v2, v0, v1

    const/16 v1, 0x26

    new-array v2, v3, [C

    fill-array-data v2, :array_8d8

    aput-object v2, v0, v1

    const/16 v1, 0x27

    new-array v2, v3, [C

    fill-array-data v2, :array_8de

    aput-object v2, v0, v1

    const/16 v1, 0x28

    new-array v2, v3, [C

    fill-array-data v2, :array_8e4

    aput-object v2, v0, v1

    const/16 v1, 0x29

    new-array v2, v3, [C

    fill-array-data v2, :array_8ea

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    new-array v2, v3, [C

    fill-array-data v2, :array_8f0

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    new-array v2, v3, [C

    fill-array-data v2, :array_8f6

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    new-array v2, v3, [C

    fill-array-data v2, :array_8fc

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    new-array v2, v3, [C

    fill-array-data v2, :array_902

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    new-array v2, v3, [C

    fill-array-data v2, :array_908

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    new-array v2, v3, [C

    fill-array-data v2, :array_90e

    aput-object v2, v0, v1

    const/16 v1, 0x30

    new-array v2, v3, [C

    fill-array-data v2, :array_914

    aput-object v2, v0, v1

    const/16 v1, 0x31

    new-array v2, v3, [C

    fill-array-data v2, :array_91a

    aput-object v2, v0, v1

    const/16 v1, 0x32

    new-array v2, v3, [C

    fill-array-data v2, :array_920

    aput-object v2, v0, v1

    const/16 v1, 0x33

    new-array v2, v3, [C

    fill-array-data v2, :array_926

    aput-object v2, v0, v1

    const/16 v1, 0x34

    new-array v2, v3, [C

    fill-array-data v2, :array_92c

    aput-object v2, v0, v1

    const/16 v1, 0x35

    new-array v2, v3, [C

    fill-array-data v2, :array_932

    aput-object v2, v0, v1

    const/16 v1, 0x36

    new-array v2, v3, [C

    fill-array-data v2, :array_938

    aput-object v2, v0, v1

    const/16 v1, 0x37

    new-array v2, v3, [C

    fill-array-data v2, :array_93e

    aput-object v2, v0, v1

    const/16 v1, 0x38

    new-array v2, v3, [C

    fill-array-data v2, :array_944

    aput-object v2, v0, v1

    const/16 v1, 0x39

    new-array v2, v3, [C

    fill-array-data v2, :array_94a

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    new-array v2, v3, [C

    fill-array-data v2, :array_950

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    new-array v2, v3, [C

    fill-array-data v2, :array_956

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    new-array v2, v3, [C

    fill-array-data v2, :array_95c

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    new-array v2, v3, [C

    fill-array-data v2, :array_962

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    new-array v2, v3, [C

    fill-array-data v2, :array_968

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    new-array v2, v3, [C

    fill-array-data v2, :array_96e

    aput-object v2, v0, v1

    const/16 v1, 0x40

    new-array v2, v3, [C

    fill-array-data v2, :array_974

    aput-object v2, v0, v1

    const/16 v1, 0x41

    new-array v2, v3, [C

    fill-array-data v2, :array_97a

    aput-object v2, v0, v1

    const/16 v1, 0x42

    new-array v2, v3, [C

    fill-array-data v2, :array_980

    aput-object v2, v0, v1

    const/16 v1, 0x43

    new-array v2, v3, [C

    fill-array-data v2, :array_986

    aput-object v2, v0, v1

    const/16 v1, 0x44

    new-array v2, v3, [C

    fill-array-data v2, :array_98c

    aput-object v2, v0, v1

    const/16 v1, 0x45

    new-array v2, v3, [C

    fill-array-data v2, :array_992

    aput-object v2, v0, v1

    const/16 v1, 0x46

    new-array v2, v3, [C

    fill-array-data v2, :array_998

    aput-object v2, v0, v1

    const/16 v1, 0x47

    new-array v2, v3, [C

    fill-array-data v2, :array_99e

    aput-object v2, v0, v1

    const/16 v1, 0x48

    new-array v2, v3, [C

    fill-array-data v2, :array_9a4

    aput-object v2, v0, v1

    const/16 v1, 0x49

    new-array v2, v3, [C

    fill-array-data v2, :array_9aa

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    new-array v2, v3, [C

    fill-array-data v2, :array_9b0

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    new-array v2, v3, [C

    fill-array-data v2, :array_9b6

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    new-array v2, v3, [C

    fill-array-data v2, :array_9bc

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    new-array v2, v3, [C

    fill-array-data v2, :array_9c2

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    new-array v2, v3, [C

    fill-array-data v2, :array_9c8

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    new-array v2, v3, [C

    fill-array-data v2, :array_9ce

    aput-object v2, v0, v1

    const/16 v1, 0x50

    new-array v2, v3, [C

    fill-array-data v2, :array_9d4

    aput-object v2, v0, v1

    const/16 v1, 0x51

    new-array v2, v3, [C

    fill-array-data v2, :array_9da

    aput-object v2, v0, v1

    const/16 v1, 0x52

    new-array v2, v3, [C

    fill-array-data v2, :array_9e0

    aput-object v2, v0, v1

    const/16 v1, 0x53

    new-array v2, v3, [C

    fill-array-data v2, :array_9e6

    aput-object v2, v0, v1

    const/16 v1, 0x54

    new-array v2, v3, [C

    fill-array-data v2, :array_9ec

    aput-object v2, v0, v1

    const/16 v1, 0x55

    new-array v2, v3, [C

    fill-array-data v2, :array_9f2

    aput-object v2, v0, v1

    const/16 v1, 0x56

    new-array v2, v3, [C

    fill-array-data v2, :array_9f8

    aput-object v2, v0, v1

    const/16 v1, 0x57

    new-array v2, v3, [C

    fill-array-data v2, :array_9fe

    aput-object v2, v0, v1

    const/16 v1, 0x58

    new-array v2, v3, [C

    fill-array-data v2, :array_a04

    aput-object v2, v0, v1

    const/16 v1, 0x59

    new-array v2, v3, [C

    fill-array-data v2, :array_a0a

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    new-array v2, v3, [C

    fill-array-data v2, :array_a10

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    new-array v2, v3, [C

    fill-array-data v2, :array_a16

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    new-array v2, v3, [C

    fill-array-data v2, :array_a1c

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    new-array v2, v3, [C

    fill-array-data v2, :array_a22

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    new-array v2, v3, [C

    fill-array-data v2, :array_a28

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    new-array v2, v3, [C

    fill-array-data v2, :array_a2e

    aput-object v2, v0, v1

    const/16 v1, 0x60

    new-array v2, v3, [C

    fill-array-data v2, :array_a34

    aput-object v2, v0, v1

    const/16 v1, 0x61

    new-array v2, v3, [C

    fill-array-data v2, :array_a3a

    aput-object v2, v0, v1

    const/16 v1, 0x62

    new-array v2, v3, [C

    fill-array-data v2, :array_a40

    aput-object v2, v0, v1

    const/16 v1, 0x63

    new-array v2, v3, [C

    fill-array-data v2, :array_a46

    aput-object v2, v0, v1

    const/16 v1, 0x64

    new-array v2, v3, [C

    fill-array-data v2, :array_a4c

    aput-object v2, v0, v1

    const/16 v1, 0x65

    new-array v2, v3, [C

    fill-array-data v2, :array_a52

    aput-object v2, v0, v1

    const/16 v1, 0x66

    new-array v2, v3, [C

    fill-array-data v2, :array_a58

    aput-object v2, v0, v1

    const/16 v1, 0x67

    new-array v2, v3, [C

    fill-array-data v2, :array_a5e

    aput-object v2, v0, v1

    const/16 v1, 0x68

    new-array v2, v3, [C

    fill-array-data v2, :array_a64

    aput-object v2, v0, v1

    const/16 v1, 0x69

    new-array v2, v3, [C

    fill-array-data v2, :array_a6a

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    new-array v2, v3, [C

    fill-array-data v2, :array_a70

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    new-array v2, v3, [C

    fill-array-data v2, :array_a76

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    new-array v2, v3, [C

    fill-array-data v2, :array_a7c

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    new-array v2, v3, [C

    fill-array-data v2, :array_a82

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    new-array v2, v3, [C

    fill-array-data v2, :array_a88

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    new-array v2, v3, [C

    fill-array-data v2, :array_a8e

    aput-object v2, v0, v1

    const/16 v1, 0x70

    new-array v2, v3, [C

    fill-array-data v2, :array_a94

    aput-object v2, v0, v1

    const/16 v1, 0x71

    new-array v2, v3, [C

    fill-array-data v2, :array_a9a

    aput-object v2, v0, v1

    const/16 v1, 0x72

    new-array v2, v3, [C

    fill-array-data v2, :array_aa0

    aput-object v2, v0, v1

    const/16 v1, 0x73

    new-array v2, v3, [C

    fill-array-data v2, :array_aa6

    aput-object v2, v0, v1

    const/16 v1, 0x74

    new-array v2, v3, [C

    fill-array-data v2, :array_aac

    aput-object v2, v0, v1

    const/16 v1, 0x75

    new-array v2, v3, [C

    fill-array-data v2, :array_ab2

    aput-object v2, v0, v1

    const/16 v1, 0x76

    new-array v2, v3, [C

    fill-array-data v2, :array_ab8

    aput-object v2, v0, v1

    const/16 v1, 0x77

    new-array v2, v3, [C

    fill-array-data v2, :array_abe

    aput-object v2, v0, v1

    const/16 v1, 0x78

    new-array v2, v3, [C

    fill-array-data v2, :array_ac4

    aput-object v2, v0, v1

    const/16 v1, 0x79

    new-array v2, v3, [C

    fill-array-data v2, :array_aca

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    new-array v2, v3, [C

    fill-array-data v2, :array_ad0

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    new-array v2, v3, [C

    fill-array-data v2, :array_ad6

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    new-array v2, v3, [C

    fill-array-data v2, :array_adc

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    new-array v2, v3, [C

    fill-array-data v2, :array_ae2

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    new-array v2, v3, [C

    fill-array-data v2, :array_ae8

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    new-array v2, v3, [C

    fill-array-data v2, :array_aee

    aput-object v2, v0, v1

    const/16 v1, 0x80

    new-array v2, v3, [C

    fill-array-data v2, :array_af4

    aput-object v2, v0, v1

    const/16 v1, 0x81

    new-array v2, v3, [C

    fill-array-data v2, :array_afa

    aput-object v2, v0, v1

    const/16 v1, 0x82

    new-array v2, v3, [C

    fill-array-data v2, :array_b00

    aput-object v2, v0, v1

    const/16 v1, 0x83

    new-array v2, v3, [C

    fill-array-data v2, :array_b06

    aput-object v2, v0, v1

    const/16 v1, 0x84

    new-array v2, v3, [C

    fill-array-data v2, :array_b0c

    aput-object v2, v0, v1

    const/16 v1, 0x85

    new-array v2, v3, [C

    fill-array-data v2, :array_b12

    aput-object v2, v0, v1

    const/16 v1, 0x86

    new-array v2, v3, [C

    fill-array-data v2, :array_b18

    aput-object v2, v0, v1

    const/16 v1, 0x87

    new-array v2, v3, [C

    fill-array-data v2, :array_b1e

    aput-object v2, v0, v1

    const/16 v1, 0x88

    new-array v2, v3, [C

    fill-array-data v2, :array_b24

    aput-object v2, v0, v1

    const/16 v1, 0x89

    new-array v2, v3, [C

    fill-array-data v2, :array_b2a

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    new-array v2, v3, [C

    fill-array-data v2, :array_b30

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    new-array v2, v3, [C

    fill-array-data v2, :array_b36

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    new-array v2, v3, [C

    fill-array-data v2, :array_b3c

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    new-array v2, v3, [C

    fill-array-data v2, :array_b42

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    new-array v2, v3, [C

    fill-array-data v2, :array_b48

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    new-array v2, v3, [C

    fill-array-data v2, :array_b4e

    aput-object v2, v0, v1

    const/16 v1, 0x90

    new-array v2, v3, [C

    fill-array-data v2, :array_b54

    aput-object v2, v0, v1

    const/16 v1, 0x91

    new-array v2, v3, [C

    fill-array-data v2, :array_b5a

    aput-object v2, v0, v1

    const/16 v1, 0x92

    new-array v2, v3, [C

    fill-array-data v2, :array_b60

    aput-object v2, v0, v1

    const/16 v1, 0x93

    new-array v2, v3, [C

    fill-array-data v2, :array_b66

    aput-object v2, v0, v1

    const/16 v1, 0x94

    new-array v2, v3, [C

    fill-array-data v2, :array_b6c

    aput-object v2, v0, v1

    const/16 v1, 0x95

    new-array v2, v3, [C

    fill-array-data v2, :array_b72

    aput-object v2, v0, v1

    const/16 v1, 0x96

    new-array v2, v3, [C

    fill-array-data v2, :array_b78

    aput-object v2, v0, v1

    const/16 v1, 0x97

    new-array v2, v3, [C

    fill-array-data v2, :array_b7e

    aput-object v2, v0, v1

    const/16 v1, 0x98

    new-array v2, v3, [C

    fill-array-data v2, :array_b84

    aput-object v2, v0, v1

    const/16 v1, 0x99

    new-array v2, v3, [C

    fill-array-data v2, :array_b8a

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    new-array v2, v3, [C

    fill-array-data v2, :array_b90

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    new-array v2, v3, [C

    fill-array-data v2, :array_b96

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    new-array v2, v3, [C

    fill-array-data v2, :array_b9c

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    new-array v2, v3, [C

    fill-array-data v2, :array_ba2

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    new-array v2, v3, [C

    fill-array-data v2, :array_ba8

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    new-array v2, v3, [C

    fill-array-data v2, :array_bae

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    new-array v2, v3, [C

    fill-array-data v2, :array_bb4

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    new-array v2, v3, [C

    fill-array-data v2, :array_bba

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    new-array v2, v3, [C

    fill-array-data v2, :array_bc0

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    new-array v2, v3, [C

    fill-array-data v2, :array_bc6

    aput-object v2, v0, v1

    const/16 v1, 0xa4

    new-array v2, v3, [C

    fill-array-data v2, :array_bcc

    aput-object v2, v0, v1

    const/16 v1, 0xa5

    new-array v2, v3, [C

    fill-array-data v2, :array_bd2

    aput-object v2, v0, v1

    const/16 v1, 0xa6

    new-array v2, v3, [C

    fill-array-data v2, :array_bd8

    aput-object v2, v0, v1

    const/16 v1, 0xa7

    new-array v2, v3, [C

    fill-array-data v2, :array_bde

    aput-object v2, v0, v1

    const/16 v1, 0xa8

    new-array v2, v3, [C

    fill-array-data v2, :array_be4

    aput-object v2, v0, v1

    const/16 v1, 0xa9

    new-array v2, v3, [C

    fill-array-data v2, :array_bea

    aput-object v2, v0, v1

    const/16 v1, 0xaa

    new-array v2, v3, [C

    fill-array-data v2, :array_bf0

    aput-object v2, v0, v1

    const/16 v1, 0xab

    new-array v2, v3, [C

    fill-array-data v2, :array_bf6

    aput-object v2, v0, v1

    const/16 v1, 0xac

    new-array v2, v3, [C

    fill-array-data v2, :array_bfc

    aput-object v2, v0, v1

    const/16 v1, 0xad

    new-array v2, v3, [C

    fill-array-data v2, :array_c02

    aput-object v2, v0, v1

    const/16 v1, 0xae

    new-array v2, v3, [C

    fill-array-data v2, :array_c08

    aput-object v2, v0, v1

    const/16 v1, 0xaf

    new-array v2, v3, [C

    fill-array-data v2, :array_c0e

    aput-object v2, v0, v1

    const/16 v1, 0xb0

    new-array v2, v3, [C

    fill-array-data v2, :array_c14

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    new-array v2, v3, [C

    fill-array-data v2, :array_c1a

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    new-array v2, v3, [C

    fill-array-data v2, :array_c20

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    new-array v2, v3, [C

    fill-array-data v2, :array_c26

    aput-object v2, v0, v1

    const/16 v1, 0xb4

    new-array v2, v3, [C

    fill-array-data v2, :array_c2c

    aput-object v2, v0, v1

    const/16 v1, 0xb5

    new-array v2, v3, [C

    fill-array-data v2, :array_c32

    aput-object v2, v0, v1

    const/16 v1, 0xb6

    new-array v2, v3, [C

    fill-array-data v2, :array_c38

    aput-object v2, v0, v1

    const/16 v1, 0xb7

    new-array v2, v3, [C

    fill-array-data v2, :array_c3e

    aput-object v2, v0, v1

    const/16 v1, 0xb8

    new-array v2, v3, [C

    fill-array-data v2, :array_c44

    aput-object v2, v0, v1

    const/16 v1, 0xb9

    new-array v2, v3, [C

    fill-array-data v2, :array_c4a

    aput-object v2, v0, v1

    const/16 v1, 0xba

    new-array v2, v3, [C

    fill-array-data v2, :array_c50

    aput-object v2, v0, v1

    const/16 v1, 0xbb

    new-array v2, v3, [C

    fill-array-data v2, :array_c56

    aput-object v2, v0, v1

    const/16 v1, 0xbc

    new-array v2, v3, [C

    fill-array-data v2, :array_c5c

    aput-object v2, v0, v1

    const/16 v1, 0xbd

    new-array v2, v3, [C

    fill-array-data v2, :array_c62

    aput-object v2, v0, v1

    const/16 v1, 0xbe

    new-array v2, v3, [C

    fill-array-data v2, :array_c68

    aput-object v2, v0, v1

    const/16 v1, 0xbf

    new-array v2, v3, [C

    fill-array-data v2, :array_c6e

    aput-object v2, v0, v1

    const/16 v1, 0xc0

    new-array v2, v3, [C

    fill-array-data v2, :array_c74

    aput-object v2, v0, v1

    const/16 v1, 0xc1

    new-array v2, v3, [C

    fill-array-data v2, :array_c7a

    aput-object v2, v0, v1

    const/16 v1, 0xc2

    new-array v2, v3, [C

    fill-array-data v2, :array_c80

    aput-object v2, v0, v1

    const/16 v1, 0xc3

    new-array v2, v3, [C

    fill-array-data v2, :array_c86

    aput-object v2, v0, v1

    const/16 v1, 0xc4

    new-array v2, v3, [C

    fill-array-data v2, :array_c8c

    aput-object v2, v0, v1

    const/16 v1, 0xc5

    new-array v2, v3, [C

    fill-array-data v2, :array_c92

    aput-object v2, v0, v1

    const/16 v1, 0xc6

    new-array v2, v3, [C

    fill-array-data v2, :array_c98

    aput-object v2, v0, v1

    const/16 v1, 0xc7

    new-array v2, v3, [C

    fill-array-data v2, :array_c9e

    aput-object v2, v0, v1

    const/16 v1, 0xc8

    new-array v2, v3, [C

    fill-array-data v2, :array_ca4

    aput-object v2, v0, v1

    const/16 v1, 0xc9

    new-array v2, v3, [C

    fill-array-data v2, :array_caa

    aput-object v2, v0, v1

    sput-object v0, Lcom/wutka/dtd/Scanner;->letterRanges:[[C

    return-void

    nop

    :array_7f4
    .array-data 2
        0x41s
        0x5as
    .end array-data

    :array_7fa
    .array-data 2
        0x61s
        0x7as
    .end array-data

    :array_800
    .array-data 2
        0xc0s
        0xd6s
    .end array-data

    :array_806
    .array-data 2
        0xd8s
        0xf6s
    .end array-data

    :array_80c
    .array-data 2
        0xf8s
        0xffs
    .end array-data

    :array_812
    .array-data 2
        0x100s
        0x131s
    .end array-data

    :array_818
    .array-data 2
        0x134s
        0x13es
    .end array-data

    :array_81e
    .array-data 2
        0x141s
        0x148s
    .end array-data

    :array_824
    .array-data 2
        0x14as
        0x17es
    .end array-data

    :array_82a
    .array-data 2
        0x180s
        0x1c3s
    .end array-data

    :array_830
    .array-data 2
        0x1cds
        0x1f0s
    .end array-data

    :array_836
    .array-data 2
        0x1f4s
        0x1f5s
    .end array-data

    :array_83c
    .array-data 2
        0x1fas
        0x217s
    .end array-data

    :array_842
    .array-data 2
        0x250s
        0x2a8s
    .end array-data

    :array_848
    .array-data 2
        0x2bbs
        0x2c1s
    .end array-data

    :array_84e
    .array-data 2
        0x386s
        0x386s
    .end array-data

    :array_854
    .array-data 2
        0x388s
        0x38as
    .end array-data

    :array_85a
    .array-data 2
        0x38cs
        0x38cs
    .end array-data

    :array_860
    .array-data 2
        0x38es
        0x3a1s
    .end array-data

    :array_866
    .array-data 2
        0x3a3s
        0x3ces
    .end array-data

    :array_86c
    .array-data 2
        0x3d0s
        0x3d6s
    .end array-data

    :array_872
    .array-data 2
        0x3das
        0x3das
    .end array-data

    :array_878
    .array-data 2
        0x3dcs
        0x3dcs
    .end array-data

    :array_87e
    .array-data 2
        0x3des
        0x3des
    .end array-data

    :array_884
    .array-data 2
        0x3e0s
        0x3e0s
    .end array-data

    :array_88a
    .array-data 2
        0x3e2s
        0x3f3s
    .end array-data

    :array_890
    .array-data 2
        0x401s
        0x40cs
    .end array-data

    :array_896
    .array-data 2
        0x40es
        0x44fs
    .end array-data

    :array_89c
    .array-data 2
        0x451s
        0x45cs
    .end array-data

    :array_8a2
    .array-data 2
        0x45es
        0x481s
    .end array-data

    :array_8a8
    .array-data 2
        0x490s
        0x4c4s
    .end array-data

    :array_8ae
    .array-data 2
        0x4c7s
        0x4c8s
    .end array-data

    :array_8b4
    .array-data 2
        0x4cbs
        0x4ccs
    .end array-data

    :array_8ba
    .array-data 2
        0x4d0s
        0x4ebs
    .end array-data

    :array_8c0
    .array-data 2
        0x4ees
        0x4f5s
    .end array-data

    :array_8c6
    .array-data 2
        0x4f8s
        0x4f9s
    .end array-data

    :array_8cc
    .array-data 2
        0x531s
        0x556s
    .end array-data

    :array_8d2
    .array-data 2
        0x559s
        0x559s
    .end array-data

    :array_8d8
    .array-data 2
        0x561s
        0x586s
    .end array-data

    :array_8de
    .array-data 2
        0x5d0s
        0x5eas
    .end array-data

    :array_8e4
    .array-data 2
        0x5f0s
        0x5f2s
    .end array-data

    :array_8ea
    .array-data 2
        0x621s
        0x63as
    .end array-data

    :array_8f0
    .array-data 2
        0x641s
        0x64as
    .end array-data

    :array_8f6
    .array-data 2
        0x671s
        0x6b7s
    .end array-data

    :array_8fc
    .array-data 2
        0x6bas
        0x6bes
    .end array-data

    :array_902
    .array-data 2
        0x6c0s
        0x6ces
    .end array-data

    :array_908
    .array-data 2
        0x6d0s
        0x6d3s
    .end array-data

    :array_90e
    .array-data 2
        0x6d5s
        0x6d5s
    .end array-data

    :array_914
    .array-data 2
        0x6e5s
        0x6e6s
    .end array-data

    :array_91a
    .array-data 2
        0x905s
        0x939s
    .end array-data

    :array_920
    .array-data 2
        0x93ds
        0x93ds
    .end array-data

    :array_926
    .array-data 2
        0x958s
        0x961s
    .end array-data

    :array_92c
    .array-data 2
        0x985s
        0x98cs
    .end array-data

    :array_932
    .array-data 2
        0x98fs
        0x990s
    .end array-data

    :array_938
    .array-data 2
        0x993s
        0x9a8s
    .end array-data

    :array_93e
    .array-data 2
        0x9aas
        0x9b0s
    .end array-data

    :array_944
    .array-data 2
        0x9b2s
        0x9b2s
    .end array-data

    :array_94a
    .array-data 2
        0x9b6s
        0x9b9s
    .end array-data

    :array_950
    .array-data 2
        0x9dcs
        0x9dds
    .end array-data

    :array_956
    .array-data 2
        0x9dfs
        0x9e1s
    .end array-data

    :array_95c
    .array-data 2
        0x9f0s
        0x9f1s
    .end array-data

    :array_962
    .array-data 2
        0xa05s
        0xa0as
    .end array-data

    :array_968
    .array-data 2
        0xa0fs
        0xa10s
    .end array-data

    :array_96e
    .array-data 2
        0xa13s
        0xa28s
    .end array-data

    :array_974
    .array-data 2
        0xa2as
        0xa30s
    .end array-data

    :array_97a
    .array-data 2
        0xa32s
        0xa33s
    .end array-data

    :array_980
    .array-data 2
        0xa35s
        0xa36s
    .end array-data

    :array_986
    .array-data 2
        0xa38s
        0xa39s
    .end array-data

    :array_98c
    .array-data 2
        0xa59s
        0xa5cs
    .end array-data

    :array_992
    .array-data 2
        0xa5es
        0xa5es
    .end array-data

    :array_998
    .array-data 2
        0xa72s
        0xa74s
    .end array-data

    :array_99e
    .array-data 2
        0xa85s
        0xa8bs
    .end array-data

    :array_9a4
    .array-data 2
        0xa8ds
        0xa8ds
    .end array-data

    :array_9aa
    .array-data 2
        0xa8fs
        0xa91s
    .end array-data

    :array_9b0
    .array-data 2
        0xa93s
        0xaa8s
    .end array-data

    :array_9b6
    .array-data 2
        0xaaas
        0xab0s
    .end array-data

    :array_9bc
    .array-data 2
        0xab2s
        0xab3s
    .end array-data

    :array_9c2
    .array-data 2
        0xab5s
        0xab9s
    .end array-data

    :array_9c8
    .array-data 2
        0xabds
        0xabds
    .end array-data

    :array_9ce
    .array-data 2
        0xae0s
        0xae0s
    .end array-data

    :array_9d4
    .array-data 2
        0xb05s
        0xb0cs
    .end array-data

    :array_9da
    .array-data 2
        0xb0fs
        0xb10s
    .end array-data

    :array_9e0
    .array-data 2
        0xb13s
        0xb28s
    .end array-data

    :array_9e6
    .array-data 2
        0xb2as
        0xb30s
    .end array-data

    :array_9ec
    .array-data 2
        0xb32s
        0xb33s
    .end array-data

    :array_9f2
    .array-data 2
        0xb36s
        0xb39s
    .end array-data

    :array_9f8
    .array-data 2
        0xb3ds
        0xb3ds
    .end array-data

    :array_9fe
    .array-data 2
        0xb5cs
        0xb5ds
    .end array-data

    :array_a04
    .array-data 2
        0xb5fs
        0xb61s
    .end array-data

    :array_a0a
    .array-data 2
        0xb85s
        0xb8as
    .end array-data

    :array_a10
    .array-data 2
        0xb8es
        0xb90s
    .end array-data

    :array_a16
    .array-data 2
        0xb92s
        0xb95s
    .end array-data

    :array_a1c
    .array-data 2
        0xb99s
        0xb9as
    .end array-data

    :array_a22
    .array-data 2
        0xb9cs
        0xb9cs
    .end array-data

    :array_a28
    .array-data 2
        0xb9es
        0xb9fs
    .end array-data

    :array_a2e
    .array-data 2
        0xba3s
        0xba4s
    .end array-data

    :array_a34
    .array-data 2
        0xba8s
        0xbaas
    .end array-data

    :array_a3a
    .array-data 2
        0xbaes
        0xbb5s
    .end array-data

    :array_a40
    .array-data 2
        0xbb7s
        0xbb9s
    .end array-data

    :array_a46
    .array-data 2
        0xc05s
        0xc0cs
    .end array-data

    :array_a4c
    .array-data 2
        0xc0es
        0xc10s
    .end array-data

    :array_a52
    .array-data 2
        0xc12s
        0xc28s
    .end array-data

    :array_a58
    .array-data 2
        0xc2as
        0xc33s
    .end array-data

    :array_a5e
    .array-data 2
        0xc35s
        0xc39s
    .end array-data

    :array_a64
    .array-data 2
        0xc60s
        0xc61s
    .end array-data

    :array_a6a
    .array-data 2
        0xc85s
        0xc8cs
    .end array-data

    :array_a70
    .array-data 2
        0xc8es
        0xc90s
    .end array-data

    :array_a76
    .array-data 2
        0xc92s
        0xca8s
    .end array-data

    :array_a7c
    .array-data 2
        0xcaas
        0xcb3s
    .end array-data

    :array_a82
    .array-data 2
        0xcb5s
        0xcb9s
    .end array-data

    :array_a88
    .array-data 2
        0xcdes
        0xcdes
    .end array-data

    :array_a8e
    .array-data 2
        0xce0s
        0xce1s
    .end array-data

    :array_a94
    .array-data 2
        0xd05s
        0xd0cs
    .end array-data

    :array_a9a
    .array-data 2
        0xd0es
        0xd10s
    .end array-data

    :array_aa0
    .array-data 2
        0xd12s
        0xd28s
    .end array-data

    :array_aa6
    .array-data 2
        0xd2as
        0xd39s
    .end array-data

    :array_aac
    .array-data 2
        0xd60s
        0xd61s
    .end array-data

    :array_ab2
    .array-data 2
        0xe01s
        0xe2es
    .end array-data

    :array_ab8
    .array-data 2
        0xe30s
        0xe30s
    .end array-data

    :array_abe
    .array-data 2
        0xe32s
        0xe33s
    .end array-data

    :array_ac4
    .array-data 2
        0xe40s
        0xe45s
    .end array-data

    :array_aca
    .array-data 2
        0xe81s
        0xe82s
    .end array-data

    :array_ad0
    .array-data 2
        0xe84s
        0xe84s
    .end array-data

    :array_ad6
    .array-data 2
        0xe87s
        0xe88s
    .end array-data

    :array_adc
    .array-data 2
        0xe8as
        0xe8as
    .end array-data

    :array_ae2
    .array-data 2
        0xe8ds
        0xe8ds
    .end array-data

    :array_ae8
    .array-data 2
        0xe94s
        0xe97s
    .end array-data

    :array_aee
    .array-data 2
        0xe99s
        0xe9fs
    .end array-data

    :array_af4
    .array-data 2
        0xea1s
        0xea3s
    .end array-data

    :array_afa
    .array-data 2
        0xea5s
        0xea5s
    .end array-data

    :array_b00
    .array-data 2
        0xea7s
        0xea7s
    .end array-data

    :array_b06
    .array-data 2
        0xeaas
        0xeabs
    .end array-data

    :array_b0c
    .array-data 2
        0xeads
        0xeaes
    .end array-data

    :array_b12
    .array-data 2
        0xeb0s
        0xeb0s
    .end array-data

    :array_b18
    .array-data 2
        0xeb2s
        0xeb3s
    .end array-data

    :array_b1e
    .array-data 2
        0xebds
        0xebds
    .end array-data

    :array_b24
    .array-data 2
        0xec0s
        0xec4s
    .end array-data

    :array_b2a
    .array-data 2
        0xf40s
        0xf47s
    .end array-data

    :array_b30
    .array-data 2
        0xf49s
        0xf69s
    .end array-data

    :array_b36
    .array-data 2
        0x10a0s
        0x10c5s
    .end array-data

    :array_b3c
    .array-data 2
        0x10d0s
        0x10f6s
    .end array-data

    :array_b42
    .array-data 2
        0x1100s
        0x1100s
    .end array-data

    :array_b48
    .array-data 2
        0x1102s
        0x1103s
    .end array-data

    :array_b4e
    .array-data 2
        0x1105s
        0x1107s
    .end array-data

    :array_b54
    .array-data 2
        0x1109s
        0x1109s
    .end array-data

    :array_b5a
    .array-data 2
        0x110bs
        0x110cs
    .end array-data

    :array_b60
    .array-data 2
        0x110es
        0x1112s
    .end array-data

    :array_b66
    .array-data 2
        0x113cs
        0x113cs
    .end array-data

    :array_b6c
    .array-data 2
        0x113es
        0x113es
    .end array-data

    :array_b72
    .array-data 2
        0x1140s
        0x1140s
    .end array-data

    :array_b78
    .array-data 2
        0x114cs
        0x114cs
    .end array-data

    :array_b7e
    .array-data 2
        0x114es
        0x114es
    .end array-data

    :array_b84
    .array-data 2
        0x1150s
        0x1150s
    .end array-data

    :array_b8a
    .array-data 2
        0x1154s
        0x1155s
    .end array-data

    :array_b90
    .array-data 2
        0x1159s
        0x1159s
    .end array-data

    :array_b96
    .array-data 2
        0x115fs
        0x1161s
    .end array-data

    :array_b9c
    .array-data 2
        0x1163s
        0x1163s
    .end array-data

    :array_ba2
    .array-data 2
        0x1165s
        0x1165s
    .end array-data

    :array_ba8
    .array-data 2
        0x1167s
        0x1167s
    .end array-data

    :array_bae
    .array-data 2
        0x1169s
        0x1169s
    .end array-data

    :array_bb4
    .array-data 2
        0x116ds
        0x116es
    .end array-data

    :array_bba
    .array-data 2
        0x1172s
        0x1173s
    .end array-data

    :array_bc0
    .array-data 2
        0x1175s
        0x1175s
    .end array-data

    :array_bc6
    .array-data 2
        0x119es
        0x119es
    .end array-data

    :array_bcc
    .array-data 2
        0x11a8s
        0x11a8s
    .end array-data

    :array_bd2
    .array-data 2
        0x11abs
        0x11abs
    .end array-data

    :array_bd8
    .array-data 2
        0x11aes
        0x11afs
    .end array-data

    :array_bde
    .array-data 2
        0x11b7s
        0x11b8s
    .end array-data

    :array_be4
    .array-data 2
        0x11bas
        0x11bas
    .end array-data

    :array_bea
    .array-data 2
        0x11bcs
        0x11c2s
    .end array-data

    :array_bf0
    .array-data 2
        0x11ebs
        0x11ebs
    .end array-data

    :array_bf6
    .array-data 2
        0x11f0s
        0x11f0s
    .end array-data

    :array_bfc
    .array-data 2
        0x11f9s
        0x11f9s
    .end array-data

    :array_c02
    .array-data 2
        0x1e00s
        0x1e9bs
    .end array-data

    :array_c08
    .array-data 2
        0x1ea0s
        0x1ef9s
    .end array-data

    :array_c0e
    .array-data 2
        0x1f00s
        0x1f15s
    .end array-data

    :array_c14
    .array-data 2
        0x1f18s
        0x1f1ds
    .end array-data

    :array_c1a
    .array-data 2
        0x1f20s
        0x1f45s
    .end array-data

    :array_c20
    .array-data 2
        0x1f48s
        0x1f4ds
    .end array-data

    :array_c26
    .array-data 2
        0x1f50s
        0x1f57s
    .end array-data

    :array_c2c
    .array-data 2
        0x1f59s
        0x1f59s
    .end array-data

    :array_c32
    .array-data 2
        0x1f5bs
        0x1f5bs
    .end array-data

    :array_c38
    .array-data 2
        0x1f5ds
        0x1f5ds
    .end array-data

    :array_c3e
    .array-data 2
        0x1f5fs
        0x1f7ds
    .end array-data

    :array_c44
    .array-data 2
        0x1f80s
        0x1fb4s
    .end array-data

    :array_c4a
    .array-data 2
        0x1fb6s
        0x1fbcs
    .end array-data

    :array_c50
    .array-data 2
        0x1fbes
        0x1fbes
    .end array-data

    :array_c56
    .array-data 2
        0x1fc2s
        0x1fc4s
    .end array-data

    :array_c5c
    .array-data 2
        0x1fc6s
        0x1fccs
    .end array-data

    :array_c62
    .array-data 2
        0x1fd0s
        0x1fd3s
    .end array-data

    :array_c68
    .array-data 2
        0x1fd6s
        0x1fdbs
    .end array-data

    :array_c6e
    .array-data 2
        0x1fe0s
        0x1fecs
    .end array-data

    :array_c74
    .array-data 2
        0x1ff2s
        0x1ff4s
    .end array-data

    :array_c7a
    .array-data 2
        0x1ff6s
        0x1ffcs
    .end array-data

    :array_c80
    .array-data 2
        0x2126s
        0x2126s
    .end array-data

    :array_c86
    .array-data 2
        0x212as
        0x212bs
    .end array-data

    :array_c8c
    .array-data 2
        0x212es
        0x212es
    .end array-data

    :array_c92
    .array-data 2
        0x2180s
        0x2182s
    .end array-data

    :array_c98
    .array-data 2
        0x3041s
        0x3094s
    .end array-data

    :array_c9e
    .array-data 2
        0x30a1s
        0x30fas
    .end array-data

    :array_ca4
    .array-data 2
        0x3105s
        0x312cs
    .end array-data

    :array_caa
    .array-data 2
        -0x5400s
        -0x285ds
    .end array-data
.end method

.method public constructor <init>(Ljava/io/Reader;Lcom/wutka/dtd/EntityExpansion;)V
    .registers 4
    .param p1, "inReader"    # Ljava/io/Reader;
    .param p2, "anExpander"    # Lcom/wutka/dtd/EntityExpansion;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V
    .registers 6
    .param p1, "inReader"    # Ljava/io/Reader;
    .param p2, "doTrace"    # Z
    .param p3, "anExpander"    # Lcom/wutka/dtd/EntityExpansion;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Lcom/wutka/dtd/Scanner$StreamInfo;

    const-string v1, ""

    invoke-direct {v0, p0, v1, p1}, Lcom/wutka/dtd/Scanner$StreamInfo;-><init>(Lcom/wutka/dtd/Scanner;Ljava/lang/String;Ljava/io/Reader;)V

    iput-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wutka/dtd/Scanner;->atEOF:Z

    .line 72
    iput-boolean p2, p0, Lcom/wutka/dtd/Scanner;->trace:Z

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    .line 74
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/Scanner;->entityExpansion:Ljava/util/Hashtable;

    .line 75
    iput-object p3, p0, Lcom/wutka/dtd/Scanner;->expander:Lcom/wutka/dtd/EntityExpansion;

    .line 76
    return-void
.end method


# virtual methods
.method public addEntity(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "entityName"    # Ljava/lang/String;
    .param p2, "entityValue"    # Ljava/lang/String;

    .prologue
    .line 827
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->entityExpansion:Ljava/util/Hashtable;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    return-void
.end method

.method public expand([C)V
    .registers 10
    .param p1, "expandChars"    # [C

    .prologue
    const/4 v7, 0x0

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 796
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    if-eqz v2, :cond_2c

    .line 798
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    array-length v2, v2

    iget v3, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    sub-int v1, v2, v3

    .line 800
    .local v1, "oldCharsLeft":I
    array-length v2, p1

    add-int/2addr v2, v1

    new-array v0, v2, [C

    .line 801
    .local v0, "newExp":[C
    array-length v2, p1

    invoke-static {p1, v5, v0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 803
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    iget v3, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    array-length v4, p1

    invoke-static {v2, v3, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 805
    iput v5, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    .line 806
    iput-object v0, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    .line 807
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    array-length v2, v2

    if-nez v2, :cond_2b

    .line 809
    iput-object v7, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    .line 810
    iput v6, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    .line 823
    .end local v0    # "newExp":[C
    .end local v1    # "oldCharsLeft":I
    :cond_2b
    :goto_2b
    return-void

    .line 815
    :cond_2c
    iput-object p1, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    .line 816
    iput v5, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    .line 817
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    array-length v2, v2

    if-nez v2, :cond_2b

    .line 819
    iput-object v7, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    .line 820
    iput v6, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    goto :goto_2b
.end method

.method public expandEntity(Ljava/lang/String;)Z
    .registers 8
    .param p1, "entityName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 762
    iget-object v4, p0, Lcom/wutka/dtd/Scanner;->entityExpansion:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 763
    .local v0, "entity":Ljava/lang/String;
    if-eqz v0, :cond_13

    .line 765
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/Scanner;->expand([C)V

    .line 791
    :goto_12
    return v3

    .line 769
    :cond_13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 772
    iget-object v4, p0, Lcom/wutka/dtd/Scanner;->expander:Lcom/wutka/dtd/EntityExpansion;

    invoke-interface {v4, p1}, Lcom/wutka/dtd/EntityExpansion;->expandEntity(Ljava/lang/String;)Lcom/wutka/dtd/DTDEntity;

    move-result-object v2

    .line 773
    .local v2, "realEntity":Lcom/wutka/dtd/DTDEntity;
    if-eqz v2, :cond_49

    .line 776
    invoke-virtual {v2}, Lcom/wutka/dtd/DTDEntity;->getReader()Ljava/io/Reader;

    move-result-object v1

    .line 777
    .local v1, "entityIn":Ljava/io/Reader;
    if-eqz v1, :cond_49

    .line 779
    iget-object v4, p0, Lcom/wutka/dtd/Scanner;->inputStreams:Ljava/util/Stack;

    if-nez v4, :cond_36

    .line 781
    new-instance v4, Ljava/util/Stack;

    invoke-direct {v4}, Ljava/util/Stack;-><init>()V

    iput-object v4, p0, Lcom/wutka/dtd/Scanner;->inputStreams:Ljava/util/Stack;

    .line 784
    :cond_36
    iget-object v4, p0, Lcom/wutka/dtd/Scanner;->inputStreams:Ljava/util/Stack;

    iget-object v5, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    invoke-virtual {v4, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 785
    new-instance v4, Lcom/wutka/dtd/Scanner$StreamInfo;

    invoke-virtual {v2}, Lcom/wutka/dtd/DTDEntity;->getExternalId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5, v1}, Lcom/wutka/dtd/Scanner$StreamInfo;-><init>(Lcom/wutka/dtd/Scanner;Ljava/lang/String;Ljava/io/Reader;)V

    iput-object v4, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    goto :goto_12

    .line 791
    .end local v1    # "entityIn":Ljava/io/Reader;
    :cond_49
    const/4 v3, 0x0

    goto :goto_12
.end method

.method public get()Lcom/wutka/dtd/Token;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v1, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    if-nez v1, :cond_a

    .line 94
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->readNextToken()Lcom/wutka/dtd/Token;

    move-result-object v1

    iput-object v1, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    .line 97
    :cond_a
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    .line 98
    .local v0, "retval":Lcom/wutka/dtd/Token;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    .line 100
    return-object v0
.end method

.method public getColumn()I
    .registers 2

    .prologue
    .line 562
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget v0, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->column:I

    return v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 561
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget v0, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->lineNumber:I

    return v0
.end method

.method public getUntil(C)Ljava/lang/String;
    .registers 5
    .param p1, "stopChar"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 181
    .local v1, "out":Ljava/lang/StringBuffer;
    :goto_5
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .local v0, "ch":I
    if-ltz v0, :cond_17

    .line 183
    if-ne v0, p1, :cond_12

    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 189
    :goto_11
    return-object v2

    .line 187
    :cond_12
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 189
    :cond_17
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_11
.end method

.method public getUriId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 560
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget-object v0, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->id:Ljava/lang/String;

    return-object v0
.end method

.method public isBaseChar(C)Z
    .registers 6
    .param p1, "ch"    # C

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 592
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    sget-object v3, Lcom/wutka/dtd/Scanner;->letterRanges:[[C

    array-length v3, v3

    if-ge v0, v3, :cond_10

    .line 594
    sget-object v3, Lcom/wutka/dtd/Scanner;->letterRanges:[[C

    aget-object v3, v3, v0

    aget-char v3, v3, v1

    if-ge p1, v3, :cond_11

    .line 598
    :cond_10
    :goto_10
    return v1

    .line 595
    :cond_11
    sget-object v3, Lcom/wutka/dtd/Scanner;->letterRanges:[[C

    aget-object v3, v3, v0

    aget-char v3, v3, v1

    if-lt p1, v3, :cond_23

    sget-object v3, Lcom/wutka/dtd/Scanner;->letterRanges:[[C

    aget-object v3, v3, v0

    aget-char v3, v3, v2

    if-gt p1, v3, :cond_23

    move v1, v2

    .line 596
    goto :goto_10

    .line 592
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method

.method public isCombiningChar(C)Z
    .registers 5
    .param p1, "ch"    # C

    .prologue
    const/16 v2, 0x300

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 646
    if-ge p1, v2, :cond_7

    .line 743
    :cond_6
    :goto_6
    return v0

    .line 647
    :cond_7
    if-lt p1, v2, :cond_f

    const/16 v2, 0x345

    if-gt p1, v2, :cond_f

    move v0, v1

    goto :goto_6

    .line 648
    :cond_f
    const/16 v2, 0x360

    if-lt p1, v2, :cond_19

    const/16 v2, 0x361

    if-gt p1, v2, :cond_19

    move v0, v1

    goto :goto_6

    .line 649
    :cond_19
    const/16 v2, 0x483

    if-lt p1, v2, :cond_23

    const/16 v2, 0x486

    if-gt p1, v2, :cond_23

    move v0, v1

    goto :goto_6

    .line 650
    :cond_23
    const/16 v2, 0x591

    if-lt p1, v2, :cond_2d

    const/16 v2, 0x5a1

    if-gt p1, v2, :cond_2d

    move v0, v1

    goto :goto_6

    .line 651
    :cond_2d
    const/16 v2, 0x5a3

    if-lt p1, v2, :cond_37

    const/16 v2, 0x5b9

    if-gt p1, v2, :cond_37

    move v0, v1

    goto :goto_6

    .line 652
    :cond_37
    const/16 v2, 0x5bb

    if-lt p1, v2, :cond_41

    const/16 v2, 0x5bd

    if-gt p1, v2, :cond_41

    move v0, v1

    goto :goto_6

    .line 653
    :cond_41
    const/16 v2, 0x5bf

    if-ne p1, v2, :cond_47

    move v0, v1

    goto :goto_6

    .line 654
    :cond_47
    const/16 v2, 0x5c1

    if-lt p1, v2, :cond_51

    const/16 v2, 0x5c2

    if-gt p1, v2, :cond_51

    move v0, v1

    goto :goto_6

    .line 655
    :cond_51
    const/16 v2, 0x5c4

    if-ne p1, v2, :cond_57

    move v0, v1

    goto :goto_6

    .line 656
    :cond_57
    const/16 v2, 0x64b

    if-lt p1, v2, :cond_61

    const/16 v2, 0x652

    if-gt p1, v2, :cond_61

    move v0, v1

    goto :goto_6

    .line 657
    :cond_61
    const/16 v2, 0x670

    if-ne p1, v2, :cond_67

    move v0, v1

    goto :goto_6

    .line 658
    :cond_67
    const/16 v2, 0x6d6

    if-lt p1, v2, :cond_71

    const/16 v2, 0x6dc

    if-gt p1, v2, :cond_71

    move v0, v1

    goto :goto_6

    .line 659
    :cond_71
    const/16 v2, 0x6dd

    if-lt p1, v2, :cond_7b

    const/16 v2, 0x6df

    if-gt p1, v2, :cond_7b

    move v0, v1

    goto :goto_6

    .line 660
    :cond_7b
    const/16 v2, 0x6e0

    if-lt p1, v2, :cond_85

    const/16 v2, 0x6e4

    if-gt p1, v2, :cond_85

    move v0, v1

    goto :goto_6

    .line 661
    :cond_85
    const/16 v2, 0x6e7

    if-lt p1, v2, :cond_90

    const/16 v2, 0x6e8

    if-gt p1, v2, :cond_90

    move v0, v1

    goto/16 :goto_6

    .line 662
    :cond_90
    const/16 v2, 0x6ea

    if-lt p1, v2, :cond_9b

    const/16 v2, 0x6ed

    if-gt p1, v2, :cond_9b

    move v0, v1

    goto/16 :goto_6

    .line 663
    :cond_9b
    const/16 v2, 0x901

    if-lt p1, v2, :cond_a6

    const/16 v2, 0x903

    if-gt p1, v2, :cond_a6

    move v0, v1

    goto/16 :goto_6

    .line 664
    :cond_a6
    const/16 v2, 0x93c

    if-ne p1, v2, :cond_ad

    move v0, v1

    goto/16 :goto_6

    .line 665
    :cond_ad
    const/16 v2, 0x93e

    if-lt p1, v2, :cond_b8

    const/16 v2, 0x94c

    if-gt p1, v2, :cond_b8

    move v0, v1

    goto/16 :goto_6

    .line 666
    :cond_b8
    const/16 v2, 0x94d

    if-ne p1, v2, :cond_bf

    move v0, v1

    goto/16 :goto_6

    .line 667
    :cond_bf
    const/16 v2, 0x951

    if-lt p1, v2, :cond_ca

    const/16 v2, 0x954

    if-gt p1, v2, :cond_ca

    move v0, v1

    goto/16 :goto_6

    .line 668
    :cond_ca
    const/16 v2, 0x962

    if-lt p1, v2, :cond_d5

    const/16 v2, 0x963

    if-gt p1, v2, :cond_d5

    move v0, v1

    goto/16 :goto_6

    .line 669
    :cond_d5
    const/16 v2, 0x981

    if-lt p1, v2, :cond_e0

    const/16 v2, 0x983

    if-gt p1, v2, :cond_e0

    move v0, v1

    goto/16 :goto_6

    .line 670
    :cond_e0
    const/16 v2, 0x9bc

    if-ne p1, v2, :cond_e7

    move v0, v1

    goto/16 :goto_6

    .line 671
    :cond_e7
    const/16 v2, 0x9be

    if-ne p1, v2, :cond_ee

    move v0, v1

    goto/16 :goto_6

    .line 672
    :cond_ee
    const/16 v2, 0x9bf

    if-ne p1, v2, :cond_f5

    move v0, v1

    goto/16 :goto_6

    .line 673
    :cond_f5
    const/16 v2, 0x9c0

    if-lt p1, v2, :cond_100

    const/16 v2, 0x9c4

    if-gt p1, v2, :cond_100

    move v0, v1

    goto/16 :goto_6

    .line 674
    :cond_100
    const/16 v2, 0x9c7

    if-lt p1, v2, :cond_10b

    const/16 v2, 0x9c8

    if-gt p1, v2, :cond_10b

    move v0, v1

    goto/16 :goto_6

    .line 675
    :cond_10b
    const/16 v2, 0x9cb

    if-lt p1, v2, :cond_116

    const/16 v2, 0x9cd

    if-gt p1, v2, :cond_116

    move v0, v1

    goto/16 :goto_6

    .line 676
    :cond_116
    const/16 v2, 0x9d7

    if-ne p1, v2, :cond_11d

    move v0, v1

    goto/16 :goto_6

    .line 677
    :cond_11d
    const/16 v2, 0x9e2

    if-lt p1, v2, :cond_128

    const/16 v2, 0x9e3

    if-gt p1, v2, :cond_128

    move v0, v1

    goto/16 :goto_6

    .line 678
    :cond_128
    const/16 v2, 0xa02

    if-ne p1, v2, :cond_12f

    move v0, v1

    goto/16 :goto_6

    .line 679
    :cond_12f
    const/16 v2, 0xa3c

    if-ne p1, v2, :cond_136

    move v0, v1

    goto/16 :goto_6

    .line 680
    :cond_136
    const/16 v2, 0xa3e

    if-ne p1, v2, :cond_13d

    move v0, v1

    goto/16 :goto_6

    .line 681
    :cond_13d
    const/16 v2, 0xa3f

    if-ne p1, v2, :cond_144

    move v0, v1

    goto/16 :goto_6

    .line 682
    :cond_144
    const/16 v2, 0xa40

    if-lt p1, v2, :cond_14f

    const/16 v2, 0xa42

    if-gt p1, v2, :cond_14f

    move v0, v1

    goto/16 :goto_6

    .line 683
    :cond_14f
    const/16 v2, 0xa47

    if-lt p1, v2, :cond_15a

    const/16 v2, 0xa48

    if-gt p1, v2, :cond_15a

    move v0, v1

    goto/16 :goto_6

    .line 684
    :cond_15a
    const/16 v2, 0xa4b

    if-lt p1, v2, :cond_165

    const/16 v2, 0xa4d

    if-gt p1, v2, :cond_165

    move v0, v1

    goto/16 :goto_6

    .line 685
    :cond_165
    const/16 v2, 0xa70

    if-lt p1, v2, :cond_170

    const/16 v2, 0xa71

    if-gt p1, v2, :cond_170

    move v0, v1

    goto/16 :goto_6

    .line 686
    :cond_170
    const/16 v2, 0xa81

    if-lt p1, v2, :cond_17b

    const/16 v2, 0xa83

    if-gt p1, v2, :cond_17b

    move v0, v1

    goto/16 :goto_6

    .line 687
    :cond_17b
    const/16 v2, 0xabc

    if-ne p1, v2, :cond_182

    move v0, v1

    goto/16 :goto_6

    .line 688
    :cond_182
    const/16 v2, 0xabe

    if-lt p1, v2, :cond_18d

    const/16 v2, 0xac5

    if-gt p1, v2, :cond_18d

    move v0, v1

    goto/16 :goto_6

    .line 689
    :cond_18d
    const/16 v2, 0xac7

    if-lt p1, v2, :cond_198

    const/16 v2, 0xac9

    if-gt p1, v2, :cond_198

    move v0, v1

    goto/16 :goto_6

    .line 690
    :cond_198
    const/16 v2, 0xacb

    if-lt p1, v2, :cond_1a3

    const/16 v2, 0xacd

    if-gt p1, v2, :cond_1a3

    move v0, v1

    goto/16 :goto_6

    .line 691
    :cond_1a3
    const/16 v2, 0xb01

    if-lt p1, v2, :cond_1ae

    const/16 v2, 0xb03

    if-gt p1, v2, :cond_1ae

    move v0, v1

    goto/16 :goto_6

    .line 692
    :cond_1ae
    const/16 v2, 0xb3c

    if-ne p1, v2, :cond_1b5

    move v0, v1

    goto/16 :goto_6

    .line 693
    :cond_1b5
    const/16 v2, 0xb3e

    if-lt p1, v2, :cond_1c0

    const/16 v2, 0xb43

    if-gt p1, v2, :cond_1c0

    move v0, v1

    goto/16 :goto_6

    .line 694
    :cond_1c0
    const/16 v2, 0xb47

    if-lt p1, v2, :cond_1cb

    const/16 v2, 0xb48

    if-gt p1, v2, :cond_1cb

    move v0, v1

    goto/16 :goto_6

    .line 695
    :cond_1cb
    const/16 v2, 0xb4b

    if-lt p1, v2, :cond_1d6

    const/16 v2, 0xb4d

    if-gt p1, v2, :cond_1d6

    move v0, v1

    goto/16 :goto_6

    .line 696
    :cond_1d6
    const/16 v2, 0xb56

    if-lt p1, v2, :cond_1e1

    const/16 v2, 0xb57

    if-gt p1, v2, :cond_1e1

    move v0, v1

    goto/16 :goto_6

    .line 697
    :cond_1e1
    const/16 v2, 0xb82

    if-lt p1, v2, :cond_1ec

    const/16 v2, 0xb83

    if-gt p1, v2, :cond_1ec

    move v0, v1

    goto/16 :goto_6

    .line 698
    :cond_1ec
    const/16 v2, 0xbbe

    if-lt p1, v2, :cond_1f7

    const/16 v2, 0xbc2

    if-gt p1, v2, :cond_1f7

    move v0, v1

    goto/16 :goto_6

    .line 699
    :cond_1f7
    const/16 v2, 0xbc6

    if-lt p1, v2, :cond_202

    const/16 v2, 0xbc8

    if-gt p1, v2, :cond_202

    move v0, v1

    goto/16 :goto_6

    .line 700
    :cond_202
    const/16 v2, 0xbca

    if-lt p1, v2, :cond_20d

    const/16 v2, 0xbcd

    if-gt p1, v2, :cond_20d

    move v0, v1

    goto/16 :goto_6

    .line 701
    :cond_20d
    const/16 v2, 0xbd7

    if-ne p1, v2, :cond_214

    move v0, v1

    goto/16 :goto_6

    .line 702
    :cond_214
    const/16 v2, 0xc01

    if-lt p1, v2, :cond_21f

    const/16 v2, 0xc03

    if-gt p1, v2, :cond_21f

    move v0, v1

    goto/16 :goto_6

    .line 703
    :cond_21f
    const/16 v2, 0xc3e

    if-lt p1, v2, :cond_22a

    const/16 v2, 0xc44

    if-gt p1, v2, :cond_22a

    move v0, v1

    goto/16 :goto_6

    .line 704
    :cond_22a
    const/16 v2, 0xc46

    if-lt p1, v2, :cond_235

    const/16 v2, 0xc48

    if-gt p1, v2, :cond_235

    move v0, v1

    goto/16 :goto_6

    .line 705
    :cond_235
    const/16 v2, 0xc4a

    if-lt p1, v2, :cond_240

    const/16 v2, 0xc4d

    if-gt p1, v2, :cond_240

    move v0, v1

    goto/16 :goto_6

    .line 706
    :cond_240
    const/16 v2, 0xc55

    if-lt p1, v2, :cond_24b

    const/16 v2, 0xc56

    if-gt p1, v2, :cond_24b

    move v0, v1

    goto/16 :goto_6

    .line 707
    :cond_24b
    const/16 v2, 0xc82

    if-lt p1, v2, :cond_256

    const/16 v2, 0xc83

    if-gt p1, v2, :cond_256

    move v0, v1

    goto/16 :goto_6

    .line 708
    :cond_256
    const/16 v2, 0xcbe

    if-lt p1, v2, :cond_261

    const/16 v2, 0xcc4

    if-gt p1, v2, :cond_261

    move v0, v1

    goto/16 :goto_6

    .line 709
    :cond_261
    const/16 v2, 0xcc6

    if-lt p1, v2, :cond_26c

    const/16 v2, 0xcc8

    if-gt p1, v2, :cond_26c

    move v0, v1

    goto/16 :goto_6

    .line 710
    :cond_26c
    const/16 v2, 0xcca

    if-lt p1, v2, :cond_277

    const/16 v2, 0xccd

    if-gt p1, v2, :cond_277

    move v0, v1

    goto/16 :goto_6

    .line 711
    :cond_277
    const/16 v2, 0xcd5

    if-lt p1, v2, :cond_282

    const/16 v2, 0xcd6

    if-gt p1, v2, :cond_282

    move v0, v1

    goto/16 :goto_6

    .line 712
    :cond_282
    const/16 v2, 0xd02

    if-lt p1, v2, :cond_28d

    const/16 v2, 0xd03

    if-gt p1, v2, :cond_28d

    move v0, v1

    goto/16 :goto_6

    .line 713
    :cond_28d
    const/16 v2, 0xd3e

    if-lt p1, v2, :cond_298

    const/16 v2, 0xd43

    if-gt p1, v2, :cond_298

    move v0, v1

    goto/16 :goto_6

    .line 714
    :cond_298
    const/16 v2, 0xd46

    if-lt p1, v2, :cond_2a3

    const/16 v2, 0xd48

    if-gt p1, v2, :cond_2a3

    move v0, v1

    goto/16 :goto_6

    .line 715
    :cond_2a3
    const/16 v2, 0xd4a

    if-lt p1, v2, :cond_2ae

    const/16 v2, 0xd4d

    if-gt p1, v2, :cond_2ae

    move v0, v1

    goto/16 :goto_6

    .line 716
    :cond_2ae
    const/16 v2, 0xd57

    if-ne p1, v2, :cond_2b5

    move v0, v1

    goto/16 :goto_6

    .line 717
    :cond_2b5
    const/16 v2, 0xe31

    if-ne p1, v2, :cond_2bc

    move v0, v1

    goto/16 :goto_6

    .line 718
    :cond_2bc
    const/16 v2, 0xe34

    if-lt p1, v2, :cond_2c7

    const/16 v2, 0xe3a

    if-gt p1, v2, :cond_2c7

    move v0, v1

    goto/16 :goto_6

    .line 719
    :cond_2c7
    const/16 v2, 0xe47

    if-lt p1, v2, :cond_2d2

    const/16 v2, 0xe4e

    if-gt p1, v2, :cond_2d2

    move v0, v1

    goto/16 :goto_6

    .line 720
    :cond_2d2
    const/16 v2, 0xeb1

    if-ne p1, v2, :cond_2d9

    move v0, v1

    goto/16 :goto_6

    .line 721
    :cond_2d9
    const/16 v2, 0xeb4

    if-lt p1, v2, :cond_2e4

    const/16 v2, 0xeb9

    if-gt p1, v2, :cond_2e4

    move v0, v1

    goto/16 :goto_6

    .line 722
    :cond_2e4
    const/16 v2, 0xebb

    if-lt p1, v2, :cond_2ef

    const/16 v2, 0xebc

    if-gt p1, v2, :cond_2ef

    move v0, v1

    goto/16 :goto_6

    .line 723
    :cond_2ef
    const/16 v2, 0xec8

    if-lt p1, v2, :cond_2fa

    const/16 v2, 0xecd

    if-gt p1, v2, :cond_2fa

    move v0, v1

    goto/16 :goto_6

    .line 724
    :cond_2fa
    const/16 v2, 0xf18

    if-lt p1, v2, :cond_305

    const/16 v2, 0xf19

    if-gt p1, v2, :cond_305

    move v0, v1

    goto/16 :goto_6

    .line 725
    :cond_305
    const/16 v2, 0xf35

    if-ne p1, v2, :cond_30c

    move v0, v1

    goto/16 :goto_6

    .line 726
    :cond_30c
    const/16 v2, 0xf37

    if-ne p1, v2, :cond_313

    move v0, v1

    goto/16 :goto_6

    .line 727
    :cond_313
    const/16 v2, 0xf39

    if-ne p1, v2, :cond_31a

    move v0, v1

    goto/16 :goto_6

    .line 728
    :cond_31a
    const/16 v2, 0xf3e

    if-ne p1, v2, :cond_321

    move v0, v1

    goto/16 :goto_6

    .line 729
    :cond_321
    const/16 v2, 0xf3f

    if-ne p1, v2, :cond_328

    move v0, v1

    goto/16 :goto_6

    .line 730
    :cond_328
    const/16 v2, 0xf71

    if-lt p1, v2, :cond_333

    const/16 v2, 0xf84

    if-gt p1, v2, :cond_333

    move v0, v1

    goto/16 :goto_6

    .line 731
    :cond_333
    const/16 v2, 0xf86

    if-lt p1, v2, :cond_33e

    const/16 v2, 0xf8b

    if-gt p1, v2, :cond_33e

    move v0, v1

    goto/16 :goto_6

    .line 732
    :cond_33e
    const/16 v2, 0xf90

    if-lt p1, v2, :cond_349

    const/16 v2, 0xf95

    if-gt p1, v2, :cond_349

    move v0, v1

    goto/16 :goto_6

    .line 733
    :cond_349
    const/16 v2, 0xf97

    if-ne p1, v2, :cond_350

    move v0, v1

    goto/16 :goto_6

    .line 734
    :cond_350
    const/16 v2, 0xf99

    if-lt p1, v2, :cond_35b

    const/16 v2, 0xfad

    if-gt p1, v2, :cond_35b

    move v0, v1

    goto/16 :goto_6

    .line 735
    :cond_35b
    const/16 v2, 0xfb1

    if-lt p1, v2, :cond_366

    const/16 v2, 0xfb7

    if-gt p1, v2, :cond_366

    move v0, v1

    goto/16 :goto_6

    .line 736
    :cond_366
    const/16 v2, 0xfb9

    if-ne p1, v2, :cond_36d

    move v0, v1

    goto/16 :goto_6

    .line 737
    :cond_36d
    const/16 v2, 0x20d0

    if-lt p1, v2, :cond_378

    const/16 v2, 0x20dc

    if-gt p1, v2, :cond_378

    move v0, v1

    goto/16 :goto_6

    .line 738
    :cond_378
    const/16 v2, 0x20e1

    if-ne p1, v2, :cond_37f

    move v0, v1

    goto/16 :goto_6

    .line 739
    :cond_37f
    const/16 v2, 0x302a

    if-lt p1, v2, :cond_38a

    const/16 v2, 0x302f

    if-gt p1, v2, :cond_38a

    move v0, v1

    goto/16 :goto_6

    .line 740
    :cond_38a
    const/16 v2, 0x3099

    if-ne p1, v2, :cond_391

    move v0, v1

    goto/16 :goto_6

    .line 741
    :cond_391
    const/16 v2, 0x309a

    if-ne p1, v2, :cond_6

    move v0, v1

    goto/16 :goto_6
.end method

.method public isDigit(C)Z
    .registers 8
    .param p1, "ch"    # C

    .prologue
    const/16 v5, 0x966

    const/16 v4, 0x6f0

    const/16 v3, 0x660

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 612
    const/16 v2, 0x30

    if-lt p1, v2, :cond_11

    const/16 v2, 0x39

    if-gt p1, v2, :cond_11

    .line 641
    :cond_10
    :goto_10
    return v0

    .line 613
    :cond_11
    if-ge p1, v3, :cond_15

    move v0, v1

    goto :goto_10

    .line 614
    :cond_15
    if-lt p1, v3, :cond_1b

    const/16 v2, 0x669

    if-le p1, v2, :cond_10

    .line 615
    :cond_1b
    if-ge p1, v4, :cond_1f

    move v0, v1

    goto :goto_10

    .line 616
    :cond_1f
    if-lt p1, v4, :cond_25

    const/16 v2, 0x6f9

    if-le p1, v2, :cond_10

    .line 617
    :cond_25
    if-ge p1, v5, :cond_29

    move v0, v1

    goto :goto_10

    .line 618
    :cond_29
    if-lt p1, v5, :cond_2f

    const/16 v2, 0x96f

    if-le p1, v2, :cond_10

    .line 619
    :cond_2f
    const/16 v2, 0x9e6

    if-ge p1, v2, :cond_35

    move v0, v1

    goto :goto_10

    .line 620
    :cond_35
    const/16 v2, 0x9e6

    if-lt p1, v2, :cond_3d

    const/16 v2, 0x9ef

    if-le p1, v2, :cond_10

    .line 621
    :cond_3d
    const/16 v2, 0xa66

    if-ge p1, v2, :cond_43

    move v0, v1

    goto :goto_10

    .line 622
    :cond_43
    const/16 v2, 0xa66

    if-lt p1, v2, :cond_4b

    const/16 v2, 0xa6f

    if-le p1, v2, :cond_10

    .line 623
    :cond_4b
    const/16 v2, 0xae6

    if-ge p1, v2, :cond_51

    move v0, v1

    goto :goto_10

    .line 624
    :cond_51
    const/16 v2, 0xae6

    if-lt p1, v2, :cond_59

    const/16 v2, 0xaef

    if-le p1, v2, :cond_10

    .line 625
    :cond_59
    const/16 v2, 0xb66

    if-ge p1, v2, :cond_5f

    move v0, v1

    goto :goto_10

    .line 626
    :cond_5f
    const/16 v2, 0xb66

    if-lt p1, v2, :cond_67

    const/16 v2, 0xb6f

    if-le p1, v2, :cond_10

    .line 627
    :cond_67
    const/16 v2, 0xbe7

    if-ge p1, v2, :cond_6d

    move v0, v1

    goto :goto_10

    .line 628
    :cond_6d
    const/16 v2, 0xbe7

    if-lt p1, v2, :cond_75

    const/16 v2, 0xbef

    if-le p1, v2, :cond_10

    .line 629
    :cond_75
    const/16 v2, 0xc66

    if-ge p1, v2, :cond_7b

    move v0, v1

    goto :goto_10

    .line 630
    :cond_7b
    const/16 v2, 0xc66

    if-lt p1, v2, :cond_83

    const/16 v2, 0xc6f

    if-le p1, v2, :cond_10

    .line 631
    :cond_83
    const/16 v2, 0xce6

    if-ge p1, v2, :cond_89

    move v0, v1

    goto :goto_10

    .line 632
    :cond_89
    const/16 v2, 0xce6

    if-lt p1, v2, :cond_91

    const/16 v2, 0xcef

    if-le p1, v2, :cond_10

    .line 633
    :cond_91
    const/16 v2, 0xd66

    if-ge p1, v2, :cond_98

    move v0, v1

    goto/16 :goto_10

    .line 634
    :cond_98
    const/16 v2, 0xd66

    if-lt p1, v2, :cond_a0

    const/16 v2, 0xd6f

    if-le p1, v2, :cond_10

    .line 635
    :cond_a0
    const/16 v2, 0xe50

    if-ge p1, v2, :cond_a7

    move v0, v1

    goto/16 :goto_10

    .line 636
    :cond_a7
    const/16 v2, 0xe50

    if-lt p1, v2, :cond_af

    const/16 v2, 0xe59

    if-le p1, v2, :cond_10

    .line 637
    :cond_af
    const/16 v2, 0xed0

    if-ge p1, v2, :cond_b6

    move v0, v1

    goto/16 :goto_10

    .line 638
    :cond_b6
    const/16 v2, 0xed0

    if-lt p1, v2, :cond_be

    const/16 v2, 0xed9

    if-le p1, v2, :cond_10

    .line 639
    :cond_be
    const/16 v2, 0xf20

    if-ge p1, v2, :cond_c5

    move v0, v1

    goto/16 :goto_10

    .line 640
    :cond_c5
    const/16 v2, 0xf20

    if-lt p1, v2, :cond_cd

    const/16 v2, 0xf29

    if-le p1, v2, :cond_10

    :cond_cd
    move v0, v1

    .line 641
    goto/16 :goto_10
.end method

.method public isExtender(C)Z
    .registers 4
    .param p1, "ch"    # C

    .prologue
    const/16 v1, 0xb7

    const/4 v0, 0x0

    .line 748
    if-ge p1, v1, :cond_6

    .line 756
    :cond_5
    :goto_5
    return v0

    .line 750
    :cond_6
    if-eq p1, v1, :cond_34

    const/16 v1, 0x2d0

    if-eq p1, v1, :cond_34

    const/16 v1, 0x2d1

    if-eq p1, v1, :cond_34

    const/16 v1, 0x387

    if-eq p1, v1, :cond_34

    const/16 v1, 0x640

    if-eq p1, v1, :cond_34

    const/16 v1, 0xe46

    if-eq p1, v1, :cond_34

    const/16 v1, 0x3031

    if-lt p1, v1, :cond_24

    const/16 v1, 0x3035

    if-le p1, v1, :cond_34

    :cond_24
    const/16 v1, 0x309d

    if-lt p1, v1, :cond_2c

    const/16 v1, 0x309e

    if-le p1, v1, :cond_34

    :cond_2c
    const/16 v1, 0x30fc

    if-lt p1, v1, :cond_5

    const/16 v1, 0x30fe

    if-gt p1, v1, :cond_5

    .line 754
    :cond_34
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public isIdentifierChar(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 566
    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isLetter(C)Z

    move-result v0

    if-nez v0, :cond_e

    const/16 v0, 0x5f

    if-eq p1, v0, :cond_e

    const/16 v0, 0x3a

    if-ne p1, v0, :cond_10

    .line 569
    :cond_e
    const/4 v0, 0x1

    .line 571
    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isIdeographic(C)Z
    .registers 5
    .param p1, "ch"    # C

    .prologue
    const/16 v2, 0x4e00

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 603
    if-ge p1, v2, :cond_7

    .line 607
    :cond_6
    :goto_6
    return v0

    .line 604
    :cond_7
    if-lt p1, v2, :cond_10

    const v2, 0x9fa5

    if-gt p1, v2, :cond_10

    move v0, v1

    goto :goto_6

    .line 605
    :cond_10
    const/16 v2, 0x3007

    if-ne p1, v2, :cond_16

    move v0, v1

    goto :goto_6

    .line 606
    :cond_16
    const/16 v2, 0x3021

    if-lt p1, v2, :cond_6

    const/16 v2, 0x3029

    if-gt p1, v2, :cond_6

    move v0, v1

    goto :goto_6
.end method

.method public isLetter(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 587
    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isBaseChar(C)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isIdeographic(C)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isNameChar(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 576
    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isLetter(C)Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isDigit(C)Z

    move-result v0

    if-nez v0, :cond_28

    const/16 v0, 0x2d

    if-eq p1, v0, :cond_28

    const/16 v0, 0x5f

    if-eq p1, v0, :cond_28

    const/16 v0, 0x2e

    if-eq p1, v0, :cond_28

    const/16 v0, 0x3a

    if-eq p1, v0, :cond_28

    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isCombiningChar(C)Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p0, p1}, Lcom/wutka/dtd/Scanner;->isExtender(C)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 580
    :cond_28
    const/4 v0, 0x1

    .line 582
    :goto_29
    return v0

    :cond_2a
    const/4 v0, 0x0

    goto :goto_29
.end method

.method public peek()Lcom/wutka/dtd/Token;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    if-nez v0, :cond_a

    .line 83
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->readNextToken()Lcom/wutka/dtd/Token;

    move-result-object v0

    iput-object v0, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    .line 86
    :cond_a
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->nextToken:Lcom/wutka/dtd/Token;

    return-object v0
.end method

.method protected peekChar()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    if-eqz v0, :cond_b

    .line 125
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    iget v1, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    aget-char v0, v0, v1

    .line 139
    :goto_a
    return v0

    .line 128
    :cond_b
    iget v0, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    if-nez v0, :cond_30

    .line 130
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->readNextChar()I

    move-result v0

    iput v0, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    .line 131
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget v1, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->column:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->column:I

    .line 132
    iget v0, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_30

    .line 134
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget v1, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->lineNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->lineNumber:I

    .line 135
    iget-object v0, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    const/4 v1, 0x1

    iput v1, v0, Lcom/wutka/dtd/Scanner$StreamInfo;->column:I

    .line 139
    :cond_30
    iget v0, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    goto :goto_a
.end method

.method protected read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    if-eqz v2, :cond_26

    .line 147
    iget-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    iget v3, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    aget-char v0, v2, v3

    .line 148
    .local v0, "expNextChar":I
    iget v2, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    iget-object v3, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    array-length v3, v3

    if-lt v2, v3, :cond_1b

    .line 150
    const/4 v2, -0x1

    iput v2, p0, Lcom/wutka/dtd/Scanner;->expandPos:I

    .line 151
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/wutka/dtd/Scanner;->expandBuffer:[C

    .line 153
    :cond_1b
    iget-boolean v2, p0, Lcom/wutka/dtd/Scanner;->trace:Z

    if-eqz v2, :cond_25

    .line 155
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    int-to-char v3, v0

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(C)V

    .line 171
    .end local v0    # "expNextChar":I
    :cond_25
    :goto_25
    return v0

    .line 159
    :cond_26
    iget v2, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    if-nez v2, :cond_2d

    .line 161
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    .line 164
    :cond_2d
    iget v1, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    .line 165
    .local v1, "retval":I
    const/4 v2, 0x0

    iput v2, p0, Lcom/wutka/dtd/Scanner;->nextChar:I

    .line 167
    iget-boolean v2, p0, Lcom/wutka/dtd/Scanner;->trace:Z

    if-eqz v2, :cond_3c

    .line 169
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    int-to-char v3, v1

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(C)V

    :cond_3c
    move v0, v1

    .line 171
    goto :goto_25
.end method

.method protected readNextChar()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v1, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget-object v1, v1, Lcom/wutka/dtd/Scanner$StreamInfo;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 108
    .local v0, "ch":I
    if-gez v0, :cond_2b

    .line 110
    iget-object v1, p0, Lcom/wutka/dtd/Scanner;->inputStreams:Ljava/util/Stack;

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lcom/wutka/dtd/Scanner;->inputStreams:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->empty()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 112
    iget-object v1, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    iget-object v1, v1, Lcom/wutka/dtd/Scanner$StreamInfo;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    .line 113
    iget-object v1, p0, Lcom/wutka/dtd/Scanner;->inputStreams:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wutka/dtd/Scanner$StreamInfo;

    iput-object v1, p0, Lcom/wutka/dtd/Scanner;->in:Lcom/wutka/dtd/Scanner$StreamInfo;

    .line 114
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->readNextChar()I

    move-result v0

    .line 117
    .end local v0    # "ch":I
    :cond_2b
    return v0
.end method

.method protected readNextToken()Lcom/wutka/dtd/Token;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x3b

    const/4 v4, 0x1

    const/16 v8, 0x3e

    const/16 v7, 0x25

    const/16 v6, 0x2d

    .line 212
    :cond_9
    :goto_9
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v1

    .line 214
    .local v1, "ch":I
    const/16 v5, 0x3c

    if-ne v1, v5, :cond_14d

    .line 216
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v1

    .line 217
    const/16 v4, 0x21

    if-ne v1, v4, :cond_134

    .line 219
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 221
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    const/16 v5, 0x5b

    if-ne v4, v5, :cond_2f

    .line 223
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 225
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->CONDITIONAL:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    .line 478
    :goto_2e
    return-object v4

    .line 228
    :cond_2f
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-eq v4, v6, :cond_3d

    .line 230
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->LTBANG:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto :goto_2e

    .line 234
    :cond_3d
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 235
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-eq v4, v6, :cond_6f

    .line 237
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Invalid character sequence <!-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 241
    :cond_6f
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 243
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 246
    .local v0, "buff":Ljava/lang/StringBuffer;
    :goto_77
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-gez v4, :cond_a6

    .line 248
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unterminated comment: <!--"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 254
    :cond_a6
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-eq v4, v6, :cond_b5

    .line 256
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_77

    .line 260
    :cond_b5
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 261
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-gez v4, :cond_e7

    .line 263
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unterminated comment: <!--"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 268
    :cond_e7
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-ne v4, v6, :cond_12f

    .line 270
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 271
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-eq v4, v8, :cond_11f

    .line 273
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Invalid character sequence --"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 277
    :cond_11f
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 278
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->COMMENT:Lcom/wutka/dtd/TokenType;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 282
    :cond_12f
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_77

    .line 288
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    :cond_134
    const/16 v4, 0x3f

    if-ne v1, v4, :cond_144

    .line 290
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 291
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->LTQUES:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 295
    :cond_144
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->LT:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 298
    :cond_14d
    const/16 v5, 0x3f

    if-ne v1, v5, :cond_15a

    .line 313
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->QUES:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 315
    :cond_15a
    const/16 v5, 0x22

    if-eq v1, v5, :cond_162

    const/16 v5, 0x27

    if-ne v1, v5, :cond_196

    .line 317
    :cond_162
    move v3, v1

    .line 319
    .local v3, "quoteChar":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 320
    .restart local v0    # "buff":Ljava/lang/StringBuffer;
    :goto_168
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    if-eq v4, v3, :cond_181

    .line 322
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v1

    .line 323
    const/16 v4, 0x5c

    if-ne v1, v4, :cond_17f

    .line 325
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_168

    .line 327
    :cond_17f
    if-gez v1, :cond_191

    .line 336
    :cond_181
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    .line 337
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 333
    :cond_191
    int-to-char v4, v1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_168

    .line 339
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    .end local v3    # "quoteChar":I
    :cond_196
    const/16 v5, 0x28

    if-ne v1, v5, :cond_1a3

    .line 341
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 343
    :cond_1a3
    const/16 v5, 0x29

    if-ne v1, v5, :cond_1b0

    .line 345
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->RPAREN:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 347
    :cond_1b0
    const/16 v5, 0x7c

    if-ne v1, v5, :cond_1bd

    .line 349
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 351
    :cond_1bd
    if-ne v1, v8, :cond_1c8

    .line 353
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 355
    :cond_1c8
    const/16 v5, 0x3d

    if-ne v1, v5, :cond_1d5

    .line 357
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->EQUAL:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 359
    :cond_1d5
    const/16 v5, 0x2a

    if-ne v1, v5, :cond_1e2

    .line 361
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->ASTERISK:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 363
    :cond_1e2
    const/16 v5, 0x5d

    if-ne v1, v5, :cond_247

    .line 365
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    const/16 v5, 0x5d

    if-eq v4, v5, :cond_213

    .line 367
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Illegal character in input stream: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 371
    :cond_213
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    if-eq v4, v8, :cond_23e

    .line 373
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Illegal character in input stream: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 378
    :cond_23e
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->ENDCONDITIONAL:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 380
    :cond_247
    const/16 v5, 0x23

    if-ne v1, v5, :cond_288

    .line 382
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 383
    .restart local v0    # "buff":Ljava/lang/StringBuffer;
    int-to-char v4, v1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 385
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/Scanner;->isIdentifierChar(C)Z

    move-result v4

    if-eqz v4, :cond_27b

    .line 387
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 389
    :goto_267
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/Scanner;->isNameChar(C)Z

    move-result v4

    if-eqz v4, :cond_27b

    .line 391
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_267

    .line 394
    :cond_27b
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 396
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    :cond_288
    const/16 v5, 0x26

    if-eq v1, v5, :cond_28e

    if-ne v1, v7, :cond_336

    .line 398
    :cond_28e
    if-ne v1, v7, :cond_2a4

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v5

    int-to-char v5, v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_2a4

    .line 400
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->PERCENT:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 403
    :cond_2a4
    if-ne v1, v7, :cond_2d7

    move v2, v4

    .line 405
    .local v2, "peRef":Z
    :goto_2a7
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 406
    .restart local v0    # "buff":Ljava/lang/StringBuffer;
    int-to-char v5, v1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 408
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {p0, v5}, Lcom/wutka/dtd/Scanner;->isIdentifierChar(C)Z

    move-result v5

    if-eqz v5, :cond_2d9

    .line 410
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 411
    :goto_2c3
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {p0, v5}, Lcom/wutka/dtd/Scanner;->isNameChar(C)Z

    move-result v5

    if-eqz v5, :cond_2d9

    .line 413
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2c3

    .line 403
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    .end local v2    # "peRef":Z
    :cond_2d7
    const/4 v2, 0x0

    goto :goto_2a7

    .line 417
    .restart local v0    # "buff":Ljava/lang/StringBuffer;
    .restart local v2    # "peRef":Z
    :cond_2d9
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v5

    if-eq v5, v9, :cond_318

    .line 419
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Expected \';\' after reference "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", found \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 424
    :cond_318
    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 426
    if-eqz v2, :cond_329

    .line 428
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/wutka/dtd/Scanner;->expandEntity(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    goto/16 :goto_9

    .line 439
    :cond_329
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 441
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    .end local v2    # "peRef":Z
    :cond_336
    const/16 v5, 0x2b

    if-ne v1, v5, :cond_343

    .line 443
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->PLUS:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 445
    :cond_343
    const/16 v5, 0x2c

    if-ne v1, v5, :cond_350

    .line 447
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->COMMA:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 449
    :cond_350
    int-to-char v5, v1

    invoke-virtual {p0, v5}, Lcom/wutka/dtd/Scanner;->isIdentifierChar(C)Z

    move-result v5

    if-eqz v5, :cond_381

    .line 451
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 452
    .restart local v0    # "buff":Ljava/lang/StringBuffer;
    int-to-char v4, v1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 454
    :goto_360
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/Scanner;->isNameChar(C)Z

    move-result v4

    if-eqz v4, :cond_374

    .line 456
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_360

    .line 458
    :cond_374
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 460
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    :cond_381
    int-to-char v5, v1

    invoke-virtual {p0, v5}, Lcom/wutka/dtd/Scanner;->isNameChar(C)Z

    move-result v5

    if-eqz v5, :cond_3b2

    .line 462
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 463
    .restart local v0    # "buff":Ljava/lang/StringBuffer;
    int-to-char v4, v1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 465
    :goto_391
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->peekChar()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/Scanner;->isNameChar(C)Z

    move-result v4

    if-eqz v4, :cond_3a5

    .line 467
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_391

    .line 469
    :cond_3a5
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->NMTOKEN:Lcom/wutka/dtd/TokenType;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 471
    .end local v0    # "buff":Ljava/lang/StringBuffer;
    :cond_3b2
    if-gez v1, :cond_3cb

    .line 473
    iget-boolean v5, p0, Lcom/wutka/dtd/Scanner;->atEOF:Z

    if-eqz v5, :cond_3c0

    .line 475
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Read past EOF"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 477
    :cond_3c0
    iput-boolean v4, p0, Lcom/wutka/dtd/Scanner;->atEOF:Z

    .line 478
    new-instance v4, Lcom/wutka/dtd/Token;

    sget-object v5, Lcom/wutka/dtd/Scanner;->EOF:Lcom/wutka/dtd/TokenType;

    invoke-direct {v4, v5}, Lcom/wutka/dtd/Token;-><init>(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_2e

    .line 480
    :cond_3cb
    int-to-char v5, v1

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-nez v5, :cond_9

    .line 486
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Illegal character in input stream: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4
.end method

.method public skipConditional()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5d

    .line 498
    const/4 v0, 0x0

    .line 499
    .local v0, "ch":I
    const/4 v1, 0x0

    .line 513
    .local v1, "nestingDepth":I
    :cond_4
    :goto_4
    if-eq v0, v3, :cond_a

    .line 515
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .line 517
    :cond_a
    if-ne v0, v3, :cond_1f

    .line 519
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .line 520
    if-ne v0, v3, :cond_1f

    .line 522
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .line 523
    const/16 v2, 0x3e

    if-ne v0, v2, :cond_1f

    .line 525
    if-nez v1, :cond_1d

    .line 558
    return-void

    .line 536
    :cond_1d
    add-int/lit8 v1, v1, -0x1

    .line 542
    :cond_1f
    const/16 v2, 0x3c

    if-ne v0, v2, :cond_4

    .line 544
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .line 545
    const/16 v2, 0x21

    if-ne v0, v2, :cond_4

    .line 547
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .line 548
    const/16 v2, 0x5b

    if-ne v0, v2, :cond_4

    .line 552
    add-int/lit8 v1, v1, 0x1

    .line 553
    goto :goto_4
.end method

.method public skipUntil(C)V
    .registers 3
    .param p1, "stopChar"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    :cond_0
    invoke-virtual {p0}, Lcom/wutka/dtd/Scanner;->read()I

    move-result v0

    .local v0, "ch":I
    if-ltz v0, :cond_8

    .line 199
    if-ne v0, p1, :cond_0

    .line 204
    :cond_8
    return-void
.end method
