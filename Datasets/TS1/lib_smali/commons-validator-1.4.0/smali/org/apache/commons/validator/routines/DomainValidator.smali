.class public Lorg/apache/commons/validator/routines/DomainValidator;
.super Ljava/lang/Object;
.source "DomainValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final COUNTRY_CODE_TLDS:[Ljava/lang/String;

.field private static final COUNTRY_CODE_TLD_LIST:Ljava/util/List;

.field private static final DOMAIN_LABEL_REGEX:Ljava/lang/String; = "\\p{Alnum}(?>[\\p{Alnum}-]*\\p{Alnum})*"

.field private static final DOMAIN_NAME_REGEX:Ljava/lang/String; = "^(?:\\p{Alnum}(?>[\\p{Alnum}-]*\\p{Alnum})*\\.)+(\\p{Alpha}{2,})$"

.field private static final DOMAIN_VALIDATOR:Lorg/apache/commons/validator/routines/DomainValidator;

.field private static final DOMAIN_VALIDATOR_WITH_LOCAL:Lorg/apache/commons/validator/routines/DomainValidator;

.field private static final GENERIC_TLDS:[Ljava/lang/String;

.field private static final GENERIC_TLD_LIST:Ljava/util/List;

.field private static final INFRASTRUCTURE_TLDS:[Ljava/lang/String;

.field private static final INFRASTRUCTURE_TLD_LIST:Ljava/util/List;

.field private static final LOCAL_TLDS:[Ljava/lang/String;

.field private static final LOCAL_TLD_LIST:Ljava/util/List;

.field private static final TOP_LABEL_REGEX:Ljava/lang/String; = "\\p{Alpha}{2,}"

.field private static final serialVersionUID:J = -0x3d2940f0b1ed13b9L


# instance fields
.field private final allowLocal:Z

.field private final domainRegex:Lorg/apache/commons/validator/routines/RegexValidator;

.field private final hostnameRegex:Lorg/apache/commons/validator/routines/RegexValidator;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 79
    new-instance v0, Lorg/apache/commons/validator/routines/DomainValidator;

    invoke-direct {v0, v3}, Lorg/apache/commons/validator/routines/DomainValidator;-><init>(Z)V

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->DOMAIN_VALIDATOR:Lorg/apache/commons/validator/routines/DomainValidator;

    .line 85
    new-instance v0, Lorg/apache/commons/validator/routines/DomainValidator;

    invoke-direct {v0, v4}, Lorg/apache/commons/validator/routines/DomainValidator;-><init>(Z)V

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->DOMAIN_VALIDATOR_WITH_LOCAL:Lorg/apache/commons/validator/routines/DomainValidator;

    .line 217
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "arpa"

    aput-object v1, v0, v3

    const-string v1, "root"

    aput-object v1, v0, v4

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->INFRASTRUCTURE_TLDS:[Ljava/lang/String;

    .line 222
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "aero"

    aput-object v1, v0, v3

    const-string v1, "asia"

    aput-object v1, v0, v4

    const-string v1, "biz"

    aput-object v1, v0, v5

    const-string v1, "cat"

    aput-object v1, v0, v6

    const-string v1, "com"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "coop"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "info"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "jobs"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "mobi"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "museum"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "name"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "net"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "org"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "pro"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "tel"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "travel"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "gov"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "edu"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "mil"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "int"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->GENERIC_TLDS:[Ljava/lang/String;

    .line 245
    const/16 v0, 0xf9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "ac"

    aput-object v1, v0, v3

    const-string v1, "ad"

    aput-object v1, v0, v4

    const-string v1, "ae"

    aput-object v1, v0, v5

    const-string v1, "af"

    aput-object v1, v0, v6

    const-string v1, "ag"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "ai"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "al"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "am"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "an"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "ao"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "aq"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "ar"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "as"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "at"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "au"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "aw"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "ax"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "az"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "ba"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "bb"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "bd"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "be"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "bf"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "bg"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "bh"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "bi"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "bj"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "bm"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "bn"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "bo"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "br"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "bs"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "bt"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "bv"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "bw"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "by"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "bz"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "ca"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "cc"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "cd"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "cf"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "cg"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "ch"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "ci"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "ck"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "cl"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "cm"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "cn"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "co"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "cr"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string v2, "cu"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string v2, "cv"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string v2, "cx"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string v2, "cy"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string v2, "cz"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string v2, "de"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string v2, "dj"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string v2, "dk"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string v2, "dm"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string v2, "do"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string v2, "dz"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string v2, "ec"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string v2, "ee"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string v2, "eg"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string v2, "er"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string v2, "es"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string v2, "et"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string v2, "eu"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string v2, "fi"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string v2, "fj"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string v2, "fk"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string v2, "fm"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string v2, "fo"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string v2, "fr"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string v2, "ga"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string v2, "gb"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string v2, "gd"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string v2, "ge"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string v2, "gf"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    const-string v2, "gg"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    const-string v2, "gh"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    const-string v2, "gi"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    const-string v2, "gl"

    aput-object v2, v0, v1

    const/16 v1, 0x53

    const-string v2, "gm"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    const-string v2, "gn"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    const-string v2, "gp"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    const-string v2, "gq"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    const-string v2, "gr"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    const-string v2, "gs"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    const-string v2, "gt"

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    const-string v2, "gu"

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    const-string v2, "gw"

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    const-string v2, "gy"

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    const-string v2, "hk"

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    const-string v2, "hm"

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    const-string v2, "hn"

    aput-object v2, v0, v1

    const/16 v1, 0x60

    const-string v2, "hr"

    aput-object v2, v0, v1

    const/16 v1, 0x61

    const-string v2, "ht"

    aput-object v2, v0, v1

    const/16 v1, 0x62

    const-string v2, "hu"

    aput-object v2, v0, v1

    const/16 v1, 0x63

    const-string v2, "id"

    aput-object v2, v0, v1

    const/16 v1, 0x64

    const-string v2, "ie"

    aput-object v2, v0, v1

    const/16 v1, 0x65

    const-string v2, "il"

    aput-object v2, v0, v1

    const/16 v1, 0x66

    const-string v2, "im"

    aput-object v2, v0, v1

    const/16 v1, 0x67

    const-string v2, "in"

    aput-object v2, v0, v1

    const/16 v1, 0x68

    const-string v2, "io"

    aput-object v2, v0, v1

    const/16 v1, 0x69

    const-string v2, "iq"

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    const-string v2, "ir"

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    const-string v2, "is"

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    const-string v2, "it"

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    const-string v2, "je"

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    const-string v2, "jm"

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    const-string v2, "jo"

    aput-object v2, v0, v1

    const/16 v1, 0x70

    const-string v2, "jp"

    aput-object v2, v0, v1

    const/16 v1, 0x71

    const-string v2, "ke"

    aput-object v2, v0, v1

    const/16 v1, 0x72

    const-string v2, "kg"

    aput-object v2, v0, v1

    const/16 v1, 0x73

    const-string v2, "kh"

    aput-object v2, v0, v1

    const/16 v1, 0x74

    const-string v2, "ki"

    aput-object v2, v0, v1

    const/16 v1, 0x75

    const-string v2, "km"

    aput-object v2, v0, v1

    const/16 v1, 0x76

    const-string v2, "kn"

    aput-object v2, v0, v1

    const/16 v1, 0x77

    const-string v2, "kp"

    aput-object v2, v0, v1

    const/16 v1, 0x78

    const-string v2, "kr"

    aput-object v2, v0, v1

    const/16 v1, 0x79

    const-string v2, "kw"

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    const-string v2, "ky"

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    const-string v2, "kz"

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    const-string v2, "la"

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    const-string v2, "lb"

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    const-string v2, "lc"

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    const-string v2, "li"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    const-string v2, "lk"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    const-string v2, "lr"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    const-string v2, "ls"

    aput-object v2, v0, v1

    const/16 v1, 0x83

    const-string v2, "lt"

    aput-object v2, v0, v1

    const/16 v1, 0x84

    const-string v2, "lu"

    aput-object v2, v0, v1

    const/16 v1, 0x85

    const-string v2, "lv"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    const-string v2, "ly"

    aput-object v2, v0, v1

    const/16 v1, 0x87

    const-string v2, "ma"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    const-string v2, "mc"

    aput-object v2, v0, v1

    const/16 v1, 0x89

    const-string v2, "md"

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    const-string v2, "me"

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    const-string v2, "mg"

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    const-string v2, "mh"

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    const-string v2, "mk"

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    const-string v2, "ml"

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    const-string v2, "mm"

    aput-object v2, v0, v1

    const/16 v1, 0x90

    const-string v2, "mn"

    aput-object v2, v0, v1

    const/16 v1, 0x91

    const-string v2, "mo"

    aput-object v2, v0, v1

    const/16 v1, 0x92

    const-string v2, "mp"

    aput-object v2, v0, v1

    const/16 v1, 0x93

    const-string v2, "mq"

    aput-object v2, v0, v1

    const/16 v1, 0x94

    const-string v2, "mr"

    aput-object v2, v0, v1

    const/16 v1, 0x95

    const-string v2, "ms"

    aput-object v2, v0, v1

    const/16 v1, 0x96

    const-string v2, "mt"

    aput-object v2, v0, v1

    const/16 v1, 0x97

    const-string v2, "mu"

    aput-object v2, v0, v1

    const/16 v1, 0x98

    const-string v2, "mv"

    aput-object v2, v0, v1

    const/16 v1, 0x99

    const-string v2, "mw"

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    const-string v2, "mx"

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    const-string v2, "my"

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    const-string v2, "mz"

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    const-string v2, "na"

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    const-string v2, "nc"

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    const-string v2, "ne"

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    const-string v2, "nf"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    const-string v2, "ng"

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    const-string v2, "ni"

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    const-string v2, "nl"

    aput-object v2, v0, v1

    const/16 v1, 0xa4

    const-string v2, "no"

    aput-object v2, v0, v1

    const/16 v1, 0xa5

    const-string v2, "np"

    aput-object v2, v0, v1

    const/16 v1, 0xa6

    const-string v2, "nr"

    aput-object v2, v0, v1

    const/16 v1, 0xa7

    const-string v2, "nu"

    aput-object v2, v0, v1

    const/16 v1, 0xa8

    const-string v2, "nz"

    aput-object v2, v0, v1

    const/16 v1, 0xa9

    const-string v2, "om"

    aput-object v2, v0, v1

    const/16 v1, 0xaa

    const-string v2, "pa"

    aput-object v2, v0, v1

    const/16 v1, 0xab

    const-string v2, "pe"

    aput-object v2, v0, v1

    const/16 v1, 0xac

    const-string v2, "pf"

    aput-object v2, v0, v1

    const/16 v1, 0xad

    const-string v2, "pg"

    aput-object v2, v0, v1

    const/16 v1, 0xae

    const-string v2, "ph"

    aput-object v2, v0, v1

    const/16 v1, 0xaf

    const-string v2, "pk"

    aput-object v2, v0, v1

    const/16 v1, 0xb0

    const-string v2, "pl"

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    const-string v2, "pm"

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    const-string v2, "pn"

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    const-string v2, "pr"

    aput-object v2, v0, v1

    const/16 v1, 0xb4

    const-string v2, "ps"

    aput-object v2, v0, v1

    const/16 v1, 0xb5

    const-string v2, "pt"

    aput-object v2, v0, v1

    const/16 v1, 0xb6

    const-string v2, "pw"

    aput-object v2, v0, v1

    const/16 v1, 0xb7

    const-string v2, "py"

    aput-object v2, v0, v1

    const/16 v1, 0xb8

    const-string v2, "qa"

    aput-object v2, v0, v1

    const/16 v1, 0xb9

    const-string v2, "re"

    aput-object v2, v0, v1

    const/16 v1, 0xba

    const-string v2, "ro"

    aput-object v2, v0, v1

    const/16 v1, 0xbb

    const-string v2, "rs"

    aput-object v2, v0, v1

    const/16 v1, 0xbc

    const-string v2, "ru"

    aput-object v2, v0, v1

    const/16 v1, 0xbd

    const-string v2, "rw"

    aput-object v2, v0, v1

    const/16 v1, 0xbe

    const-string v2, "sa"

    aput-object v2, v0, v1

    const/16 v1, 0xbf

    const-string v2, "sb"

    aput-object v2, v0, v1

    const/16 v1, 0xc0

    const-string v2, "sc"

    aput-object v2, v0, v1

    const/16 v1, 0xc1

    const-string v2, "sd"

    aput-object v2, v0, v1

    const/16 v1, 0xc2

    const-string v2, "se"

    aput-object v2, v0, v1

    const/16 v1, 0xc3

    const-string v2, "sg"

    aput-object v2, v0, v1

    const/16 v1, 0xc4

    const-string v2, "sh"

    aput-object v2, v0, v1

    const/16 v1, 0xc5

    const-string v2, "si"

    aput-object v2, v0, v1

    const/16 v1, 0xc6

    const-string v2, "sj"

    aput-object v2, v0, v1

    const/16 v1, 0xc7

    const-string v2, "sk"

    aput-object v2, v0, v1

    const/16 v1, 0xc8

    const-string v2, "sl"

    aput-object v2, v0, v1

    const/16 v1, 0xc9

    const-string v2, "sm"

    aput-object v2, v0, v1

    const/16 v1, 0xca

    const-string v2, "sn"

    aput-object v2, v0, v1

    const/16 v1, 0xcb

    const-string v2, "so"

    aput-object v2, v0, v1

    const/16 v1, 0xcc

    const-string v2, "sr"

    aput-object v2, v0, v1

    const/16 v1, 0xcd

    const-string v2, "st"

    aput-object v2, v0, v1

    const/16 v1, 0xce

    const-string v2, "su"

    aput-object v2, v0, v1

    const/16 v1, 0xcf

    const-string v2, "sv"

    aput-object v2, v0, v1

    const/16 v1, 0xd0

    const-string v2, "sy"

    aput-object v2, v0, v1

    const/16 v1, 0xd1

    const-string v2, "sz"

    aput-object v2, v0, v1

    const/16 v1, 0xd2

    const-string v2, "tc"

    aput-object v2, v0, v1

    const/16 v1, 0xd3

    const-string v2, "td"

    aput-object v2, v0, v1

    const/16 v1, 0xd4

    const-string v2, "tf"

    aput-object v2, v0, v1

    const/16 v1, 0xd5

    const-string v2, "tg"

    aput-object v2, v0, v1

    const/16 v1, 0xd6

    const-string v2, "th"

    aput-object v2, v0, v1

    const/16 v1, 0xd7

    const-string v2, "tj"

    aput-object v2, v0, v1

    const/16 v1, 0xd8

    const-string v2, "tk"

    aput-object v2, v0, v1

    const/16 v1, 0xd9

    const-string v2, "tl"

    aput-object v2, v0, v1

    const/16 v1, 0xda

    const-string v2, "tm"

    aput-object v2, v0, v1

    const/16 v1, 0xdb

    const-string v2, "tn"

    aput-object v2, v0, v1

    const/16 v1, 0xdc

    const-string v2, "to"

    aput-object v2, v0, v1

    const/16 v1, 0xdd

    const-string v2, "tp"

    aput-object v2, v0, v1

    const/16 v1, 0xde

    const-string v2, "tr"

    aput-object v2, v0, v1

    const/16 v1, 0xdf

    const-string v2, "tt"

    aput-object v2, v0, v1

    const/16 v1, 0xe0

    const-string v2, "tv"

    aput-object v2, v0, v1

    const/16 v1, 0xe1

    const-string v2, "tw"

    aput-object v2, v0, v1

    const/16 v1, 0xe2

    const-string v2, "tz"

    aput-object v2, v0, v1

    const/16 v1, 0xe3

    const-string v2, "ua"

    aput-object v2, v0, v1

    const/16 v1, 0xe4

    const-string v2, "ug"

    aput-object v2, v0, v1

    const/16 v1, 0xe5

    const-string v2, "uk"

    aput-object v2, v0, v1

    const/16 v1, 0xe6

    const-string v2, "um"

    aput-object v2, v0, v1

    const/16 v1, 0xe7

    const-string v2, "us"

    aput-object v2, v0, v1

    const/16 v1, 0xe8

    const-string v2, "uy"

    aput-object v2, v0, v1

    const/16 v1, 0xe9

    const-string v2, "uz"

    aput-object v2, v0, v1

    const/16 v1, 0xea

    const-string v2, "va"

    aput-object v2, v0, v1

    const/16 v1, 0xeb

    const-string v2, "vc"

    aput-object v2, v0, v1

    const/16 v1, 0xec

    const-string v2, "ve"

    aput-object v2, v0, v1

    const/16 v1, 0xed

    const-string v2, "vg"

    aput-object v2, v0, v1

    const/16 v1, 0xee

    const-string v2, "vi"

    aput-object v2, v0, v1

    const/16 v1, 0xef

    const-string v2, "vn"

    aput-object v2, v0, v1

    const/16 v1, 0xf0

    const-string v2, "vu"

    aput-object v2, v0, v1

    const/16 v1, 0xf1

    const-string v2, "wf"

    aput-object v2, v0, v1

    const/16 v1, 0xf2

    const-string v2, "ws"

    aput-object v2, v0, v1

    const/16 v1, 0xf3

    const-string v2, "ye"

    aput-object v2, v0, v1

    const/16 v1, 0xf4

    const-string v2, "yt"

    aput-object v2, v0, v1

    const/16 v1, 0xf5

    const-string v2, "yu"

    aput-object v2, v0, v1

    const/16 v1, 0xf6

    const-string v2, "za"

    aput-object v2, v0, v1

    const/16 v1, 0xf7

    const-string v2, "zm"

    aput-object v2, v0, v1

    const/16 v1, 0xf8

    const-string v2, "zw"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->COUNTRY_CODE_TLDS:[Ljava/lang/String;

    .line 497
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "localhost"

    aput-object v1, v0, v3

    const-string v1, "localdomain"

    aput-object v1, v0, v4

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->LOCAL_TLDS:[Ljava/lang/String;

    .line 502
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->INFRASTRUCTURE_TLDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->INFRASTRUCTURE_TLD_LIST:Ljava/util/List;

    .line 503
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->GENERIC_TLDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->GENERIC_TLD_LIST:Ljava/util/List;

    .line 504
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->COUNTRY_CODE_TLDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->COUNTRY_CODE_TLD_LIST:Ljava/util/List;

    .line 505
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->LOCAL_TLDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->LOCAL_TLD_LIST:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Z)V
    .registers 4
    .param p1, "allowLocal"    # Z

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Lorg/apache/commons/validator/routines/RegexValidator;

    const-string v1, "^(?:\\p{Alnum}(?>[\\p{Alnum}-]*\\p{Alnum})*\\.)+(\\p{Alpha}{2,})$"

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/DomainValidator;->domainRegex:Lorg/apache/commons/validator/routines/RegexValidator;

    .line 95
    new-instance v0, Lorg/apache/commons/validator/routines/RegexValidator;

    const-string v1, "\\p{Alnum}(?>[\\p{Alnum}-]*\\p{Alnum})*"

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/DomainValidator;->hostnameRegex:Lorg/apache/commons/validator/routines/RegexValidator;

    .line 122
    iput-boolean p1, p0, Lorg/apache/commons/validator/routines/DomainValidator;->allowLocal:Z

    .line 123
    return-void
.end method

.method private chompLeadingDot(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 205
    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 206
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 208
    .end local p1    # "str":Ljava/lang/String;
    :cond_d
    return-object p1
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/DomainValidator;
    .registers 1

    .prologue
    .line 104
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->DOMAIN_VALIDATOR:Lorg/apache/commons/validator/routines/DomainValidator;

    return-object v0
.end method

.method public static getInstance(Z)Lorg/apache/commons/validator/routines/DomainValidator;
    .registers 2
    .param p0, "allowLocal"    # Z

    .prologue
    .line 114
    if-eqz p0, :cond_5

    .line 115
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->DOMAIN_VALIDATOR_WITH_LOCAL:Lorg/apache/commons/validator/routines/DomainValidator;

    .line 117
    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->DOMAIN_VALIDATOR:Lorg/apache/commons/validator/routines/DomainValidator;

    goto :goto_4
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 5
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 133
    iget-object v2, p0, Lorg/apache/commons/validator/routines/DomainValidator;->domainRegex:Lorg/apache/commons/validator/routines/RegexValidator;

    invoke-virtual {v2, p1}, Lorg/apache/commons/validator/routines/RegexValidator;->match(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "groups":[Ljava/lang/String;
    if-eqz v0, :cond_13

    array-length v2, v0

    if-lez v2, :cond_13

    .line 135
    aget-object v1, v0, v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/validator/routines/DomainValidator;->isValidTld(Ljava/lang/String;)Z

    move-result v1

    .line 141
    :cond_12
    :goto_12
    return v1

    .line 136
    :cond_13
    iget-boolean v2, p0, Lorg/apache/commons/validator/routines/DomainValidator;->allowLocal:Z

    if-eqz v2, :cond_12

    .line 137
    iget-object v2, p0, Lorg/apache/commons/validator/routines/DomainValidator;->hostnameRegex:Lorg/apache/commons/validator/routines/RegexValidator;

    invoke-virtual {v2, p1}, Lorg/apache/commons/validator/routines/RegexValidator;->isValid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 138
    const/4 v1, 0x1

    goto :goto_12
.end method

.method public isValidCountryCodeTld(Ljava/lang/String;)Z
    .registers 4
    .param p1, "ccTld"    # Ljava/lang/String;

    .prologue
    .line 190
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->COUNTRY_CODE_TLD_LIST:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/validator/routines/DomainValidator;->chompLeadingDot(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isValidGenericTld(Ljava/lang/String;)Z
    .registers 4
    .param p1, "gTld"    # Ljava/lang/String;

    .prologue
    .line 179
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->GENERIC_TLD_LIST:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/validator/routines/DomainValidator;->chompLeadingDot(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isValidInfrastructureTld(Ljava/lang/String;)Z
    .registers 4
    .param p1, "iTld"    # Ljava/lang/String;

    .prologue
    .line 168
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->INFRASTRUCTURE_TLD_LIST:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/validator/routines/DomainValidator;->chompLeadingDot(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isValidLocalTld(Ljava/lang/String;)Z
    .registers 4
    .param p1, "iTld"    # Ljava/lang/String;

    .prologue
    .line 201
    sget-object v0, Lorg/apache/commons/validator/routines/DomainValidator;->LOCAL_TLD_LIST:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/validator/routines/DomainValidator;->chompLeadingDot(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isValidTld(Ljava/lang/String;)Z
    .registers 4
    .param p1, "tld"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 152
    iget-boolean v1, p0, Lorg/apache/commons/validator/routines/DomainValidator;->allowLocal:Z

    if-eqz v1, :cond_c

    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/DomainValidator;->isValidLocalTld(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 155
    :cond_b
    :goto_b
    return v0

    :cond_c
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/DomainValidator;->isValidInfrastructureTld(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/DomainValidator;->isValidGenericTld(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/DomainValidator;->isValidCountryCodeTld(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    const/4 v0, 0x0

    goto :goto_b
.end method
