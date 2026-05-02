.class public Lcom/google/tts/ConfigurationManager;
.super Landroid/app/Activity;
.source "ConfigurationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/tts/ConfigurationManager$dataDownloader;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static allFilesExist()Z
    .registers 12

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 62
    const-string v4, "/sdcard/espeak-data/"

    .line 64
    .local v4, "espeakDataDirStr":Ljava/lang/String;
    const/16 v10, 0xab

    new-array v0, v10, [Ljava/lang/String;

    const-string v10, "af_dict"

    aput-object v10, v0, v8

    const-string v10, "config"

    aput-object v10, v0, v9

    const/4 v10, 0x2

    const-string v11, "cs_dict"

    aput-object v11, v0, v10

    const/4 v10, 0x3

    const-string v11, "cy_dict"

    aput-object v11, v0, v10

    const/4 v10, 0x4

    const-string v11, "de_dict"

    aput-object v11, v0, v10

    const/4 v10, 0x5

    const-string v11, "el_dict"

    aput-object v11, v0, v10

    const/4 v10, 0x6

    const-string v11, "en_dict"

    aput-object v11, v0, v10

    const/4 v10, 0x7

    const-string v11, "eo_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x8

    .line 65
    const-string v11, "es_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x9

    const-string v11, "fi_dict"

    aput-object v11, v0, v10

    const/16 v10, 0xa

    const-string v11, "fr_dict"

    aput-object v11, v0, v10

    const/16 v10, 0xb

    const-string v11, "grc_dict"

    aput-object v11, v0, v10

    const/16 v10, 0xc

    const-string v11, "hbs_dict"

    aput-object v11, v0, v10

    const/16 v10, 0xd

    const-string v11, "hi_dict"

    aput-object v11, v0, v10

    const/16 v10, 0xe

    const-string v11, "hu_dict"

    aput-object v11, v0, v10

    const/16 v10, 0xf

    .line 66
    const-string v11, "id_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x10

    const-string v11, "is_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x11

    const-string v11, "it_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x12

    const-string v11, "jbo_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x13

    const-string v11, "ku_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x14

    const-string v11, "la_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x15

    const-string v11, "mk_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x16

    .line 67
    const-string v11, "nl_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x17

    const-string v11, "no_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x18

    const-string v11, "phondata"

    aput-object v11, v0, v10

    const/16 v10, 0x19

    const-string v11, "phonindex"

    aput-object v11, v0, v10

    const/16 v10, 0x1a

    const-string v11, "phontab"

    aput-object v11, v0, v10

    const/16 v10, 0x1b

    const-string v11, "pl_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x1c

    const-string v11, "pt_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x1d

    .line 68
    const-string v11, "ro_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x1e

    const-string v11, "ru_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x1f

    const-string v11, "sk_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x20

    const-string v11, "sv_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x21

    const-string v11, "sw_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x22

    const-string v11, "ta_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x23

    const-string v11, "tr_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x24

    const-string v11, "vi_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x25

    .line 69
    const-string v11, "zh_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x26

    const-string v11, "zhy_dict"

    aput-object v11, v0, v10

    const/16 v10, 0x27

    const-string v11, "mbrola/dummyfile"

    aput-object v11, v0, v10

    const/16 v10, 0x28

    const-string v11, "mbrola_ph/af1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x29

    .line 70
    const-string v11, "mbrola_ph/ca1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x2a

    const-string v11, "mbrola_ph/cr1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x2b

    const-string v11, "mbrola_ph/cs_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x2c

    .line 71
    const-string v11, "mbrola_ph/de2_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x2d

    const-string v11, "mbrola_ph/de4_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x2e

    const-string v11, "mbrola_ph/de6_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x2f

    .line 72
    const-string v11, "mbrola_ph/en1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x30

    const-string v11, "mbrola_ph/es_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x31

    const-string v11, "mbrola_ph/es4_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x32

    .line 73
    const-string v11, "mbrola_ph/fr1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x33

    const-string v11, "mbrola_ph/gr2_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x34

    const-string v11, "mbrola_ph/grc-de6_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x35

    .line 74
    const-string v11, "mbrola_ph/hu1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x36

    const-string v11, "mbrola_ph/id1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x37

    const-string v11, "mbrola_ph/in1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x38

    .line 75
    const-string v11, "mbrola_ph/it3_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x39

    const-string v11, "mbrola_ph/la1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x3a

    const-string v11, "mbrola_ph/nl_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x3b

    .line 76
    const-string v11, "mbrola_ph/pl1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x3c

    const-string v11, "mbrola_ph/pt_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x3d

    const-string v11, "mbrola_ph/ptbr_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x3e

    .line 77
    const-string v11, "mbrola_ph/ptbr4_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x3f

    const-string v11, "mbrola_ph/ro1_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x40

    const-string v11, "mbrola_ph/sv_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x41

    .line 78
    const-string v11, "mbrola_ph/sv2_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x42

    const-string v11, "mbrola_ph/us_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x43

    const-string v11, "mbrola_ph/us3_phtrans"

    aput-object v11, v0, v10

    const/16 v10, 0x44

    .line 79
    const-string v11, "soundicons/dummyfile"

    aput-object v11, v0, v10

    const/16 v10, 0x45

    const-string v11, "voices/af"

    aput-object v11, v0, v10

    const/16 v10, 0x46

    const-string v11, "voices/bs"

    aput-object v11, v0, v10

    const/16 v10, 0x47

    const-string v11, "voices/cs"

    aput-object v11, v0, v10

    const/16 v10, 0x48

    const-string v11, "voices/cy"

    aput-object v11, v0, v10

    const/16 v10, 0x49

    .line 80
    const-string v11, "voices/de"

    aput-object v11, v0, v10

    const/16 v10, 0x4a

    const-string v11, "voices/default"

    aput-object v11, v0, v10

    const/16 v10, 0x4b

    const-string v11, "voices/el"

    aput-object v11, v0, v10

    const/16 v10, 0x4c

    const-string v11, "voices/eo"

    aput-object v11, v0, v10

    const/16 v10, 0x4d

    const-string v11, "voices/es"

    aput-object v11, v0, v10

    const/16 v10, 0x4e

    const-string v11, "voices/es-la"

    aput-object v11, v0, v10

    const/16 v10, 0x4f

    .line 81
    const-string v11, "voices/fi"

    aput-object v11, v0, v10

    const/16 v10, 0x50

    const-string v11, "voices/fr"

    aput-object v11, v0, v10

    const/16 v10, 0x51

    const-string v11, "voices/fr-be"

    aput-object v11, v0, v10

    const/16 v10, 0x52

    const-string v11, "voices/grc"

    aput-object v11, v0, v10

    const/16 v10, 0x53

    const-string v11, "voices/hi"

    aput-object v11, v0, v10

    const/16 v10, 0x54

    const-string v11, "voices/hr"

    aput-object v11, v0, v10

    const/16 v10, 0x55

    .line 82
    const-string v11, "voices/hu"

    aput-object v11, v0, v10

    const/16 v10, 0x56

    const-string v11, "voices/id"

    aput-object v11, v0, v10

    const/16 v10, 0x57

    const-string v11, "voices/is"

    aput-object v11, v0, v10

    const/16 v10, 0x58

    const-string v11, "voices/it"

    aput-object v11, v0, v10

    const/16 v10, 0x59

    const-string v11, "voices/jbo"

    aput-object v11, v0, v10

    const/16 v10, 0x5a

    const-string v11, "voices/ku"

    aput-object v11, v0, v10

    const/16 v10, 0x5b

    .line 83
    const-string v11, "voices/la"

    aput-object v11, v0, v10

    const/16 v10, 0x5c

    const-string v11, "voices/mk"

    aput-object v11, v0, v10

    const/16 v10, 0x5d

    const-string v11, "voices/nl"

    aput-object v11, v0, v10

    const/16 v10, 0x5e

    const-string v11, "voices/no"

    aput-object v11, v0, v10

    const/16 v10, 0x5f

    const-string v11, "voices/pl"

    aput-object v11, v0, v10

    const/16 v10, 0x60

    const-string v11, "voices/pt"

    aput-object v11, v0, v10

    const/16 v10, 0x61

    .line 84
    const-string v11, "voices/pt-pt"

    aput-object v11, v0, v10

    const/16 v10, 0x62

    const-string v11, "voices/ro"

    aput-object v11, v0, v10

    const/16 v10, 0x63

    const-string v11, "voices/ru"

    aput-object v11, v0, v10

    const/16 v10, 0x64

    const-string v11, "voices/sk"

    aput-object v11, v0, v10

    const/16 v10, 0x65

    const-string v11, "voices/sr"

    aput-object v11, v0, v10

    const/16 v10, 0x66

    const-string v11, "voices/sv"

    aput-object v11, v0, v10

    const/16 v10, 0x67

    .line 85
    const-string v11, "voices/sw"

    aput-object v11, v0, v10

    const/16 v10, 0x68

    const-string v11, "voices/ta"

    aput-object v11, v0, v10

    const/16 v10, 0x69

    const-string v11, "voices/tr"

    aput-object v11, v0, v10

    const/16 v10, 0x6a

    const-string v11, "voices/vi"

    aput-object v11, v0, v10

    const/16 v10, 0x6b

    const-string v11, "voices/zh"

    aput-object v11, v0, v10

    const/16 v10, 0x6c

    const-string v11, "voices/zhy"

    aput-object v11, v0, v10

    const/16 v10, 0x6d

    .line 86
    const-string v11, "voices/!v/croak"

    aput-object v11, v0, v10

    const/16 v10, 0x6e

    const-string v11, "voices/!v/f1"

    aput-object v11, v0, v10

    const/16 v10, 0x6f

    const-string v11, "voices/!v/f2"

    aput-object v11, v0, v10

    const/16 v10, 0x70

    const-string v11, "voices/!v/f3"

    aput-object v11, v0, v10

    const/16 v10, 0x71

    const-string v11, "voices/!v/f4"

    aput-object v11, v0, v10

    const/16 v10, 0x72

    .line 87
    const-string v11, "voices/!v/m1"

    aput-object v11, v0, v10

    const/16 v10, 0x73

    const-string v11, "voices/!v/m2"

    aput-object v11, v0, v10

    const/16 v10, 0x74

    const-string v11, "voices/!v/m3"

    aput-object v11, v0, v10

    const/16 v10, 0x75

    const-string v11, "voices/!v/m4"

    aput-object v11, v0, v10

    const/16 v10, 0x76

    const-string v11, "voices/!v/m5"

    aput-object v11, v0, v10

    const/16 v10, 0x77

    .line 88
    const-string v11, "voices/!v/m6"

    aput-object v11, v0, v10

    const/16 v10, 0x78

    const-string v11, "voices/!v/whisper"

    aput-object v11, v0, v10

    const/16 v10, 0x79

    const-string v11, "voices/en/en"

    aput-object v11, v0, v10

    const/16 v10, 0x7a

    const-string v11, "voices/en/en-n"

    aput-object v11, v0, v10

    const/16 v10, 0x7b

    .line 89
    const-string v11, "voices/en/en-r"

    aput-object v11, v0, v10

    const/16 v10, 0x7c

    const-string v11, "voices/en/en-rp"

    aput-object v11, v0, v10

    const/16 v10, 0x7d

    const-string v11, "voices/en/en-sc"

    aput-object v11, v0, v10

    const/16 v10, 0x7e

    const-string v11, "voices/en/en-wi"

    aput-object v11, v0, v10

    const/16 v10, 0x7f

    .line 90
    const-string v11, "voices/en/en-wm"

    aput-object v11, v0, v10

    const/16 v10, 0x80

    const-string v11, "voices/mb/mb-af1"

    aput-object v11, v0, v10

    const/16 v10, 0x81

    const-string v11, "voices/mb/mb-af1-en"

    aput-object v11, v0, v10

    const/16 v10, 0x82

    const-string v11, "voices/mb/mb-br1"

    aput-object v11, v0, v10

    const/16 v10, 0x83

    .line 91
    const-string v11, "voices/mb/mb-br3"

    aput-object v11, v0, v10

    const/16 v10, 0x84

    const-string v11, "voices/mb/mb-br4"

    aput-object v11, v0, v10

    const/16 v10, 0x85

    const-string v11, "voices/mb/mb-cr1"

    aput-object v11, v0, v10

    const/16 v10, 0x86

    const-string v11, "voices/mb/mb-cz2"

    aput-object v11, v0, v10

    const/16 v10, 0x87

    .line 92
    const-string v11, "voices/mb/mb-de2"

    aput-object v11, v0, v10

    const/16 v10, 0x88

    const-string v11, "voices/mb/mb-de4"

    aput-object v11, v0, v10

    const/16 v10, 0x89

    const-string v11, "voices/mb/mb-de4-en"

    aput-object v11, v0, v10

    const/16 v10, 0x8a

    const-string v11, "voices/mb/mb-de5"

    aput-object v11, v0, v10

    const/16 v10, 0x8b

    .line 93
    const-string v11, "voices/mb/mb-de5-en"

    aput-object v11, v0, v10

    const/16 v10, 0x8c

    const-string v11, "voices/mb/mb-de6"

    aput-object v11, v0, v10

    const/16 v10, 0x8d

    const-string v11, "voices/mb/mb-de6-grc"

    aput-object v11, v0, v10

    const/16 v10, 0x8e

    const-string v11, "voices/mb/mb-de7"

    aput-object v11, v0, v10

    const/16 v10, 0x8f

    .line 94
    const-string v11, "voices/mb/mb-en1"

    aput-object v11, v0, v10

    const/16 v10, 0x90

    const-string v11, "voices/mb/mb-es1"

    aput-object v11, v0, v10

    const/16 v10, 0x91

    const-string v11, "voices/mb/mb-es2"

    aput-object v11, v0, v10

    const/16 v10, 0x92

    const-string v11, "voices/mb/mb-fr1"

    aput-object v11, v0, v10

    const/16 v10, 0x93

    .line 95
    const-string v11, "voices/mb/mb-fr1-en"

    aput-object v11, v0, v10

    const/16 v10, 0x94

    const-string v11, "voices/mb/mb-fr4"

    aput-object v11, v0, v10

    const/16 v10, 0x95

    const-string v11, "voices/mb/mb-fr4-en"

    aput-object v11, v0, v10

    const/16 v10, 0x96

    const-string v11, "voices/mb/mb-gr2"

    aput-object v11, v0, v10

    const/16 v10, 0x97

    .line 96
    const-string v11, "voices/mb/mb-gr2-en"

    aput-object v11, v0, v10

    const/16 v10, 0x98

    const-string v11, "voices/mb/mb-hu1"

    aput-object v11, v0, v10

    const/16 v10, 0x99

    const-string v11, "voices/mb/mb-hu1-en"

    aput-object v11, v0, v10

    const/16 v10, 0x9a

    const-string v11, "voices/mb/mb-id1"

    aput-object v11, v0, v10

    const/16 v10, 0x9b

    .line 97
    const-string v11, "voices/mb/mb-it3"

    aput-object v11, v0, v10

    const/16 v10, 0x9c

    const-string v11, "voices/mb/mb-it4"

    aput-object v11, v0, v10

    const/16 v10, 0x9d

    const-string v11, "voices/mb/mb-la1"

    aput-object v11, v0, v10

    const/16 v10, 0x9e

    const-string v11, "voices/mb/mb-nl2"

    aput-object v11, v0, v10

    const/16 v10, 0x9f

    .line 98
    const-string v11, "voices/mb/mb-nl2-en"

    aput-object v11, v0, v10

    const/16 v10, 0xa0

    const-string v11, "voices/mb/mb-pl1"

    aput-object v11, v0, v10

    const/16 v10, 0xa1

    const-string v11, "voices/mb/mb-pl1-en"

    aput-object v11, v0, v10

    const/16 v10, 0xa2

    const-string v11, "voices/mb/mb-ro1"

    aput-object v11, v0, v10

    const/16 v10, 0xa3

    .line 99
    const-string v11, "voices/mb/mb-ro1-en"

    aput-object v11, v0, v10

    const/16 v10, 0xa4

    const-string v11, "voices/mb/mb-sw1"

    aput-object v11, v0, v10

    const/16 v10, 0xa5

    const-string v11, "voices/mb/mb-sw1-en"

    aput-object v11, v0, v10

    const/16 v10, 0xa6

    const-string v11, "voices/mb/mb-sw2"

    aput-object v11, v0, v10

    const/16 v10, 0xa7

    .line 100
    const-string v11, "voices/mb/mb-sw2-en"

    aput-object v11, v0, v10

    const/16 v10, 0xa8

    const-string v11, "voices/mb/mb-us1"

    aput-object v11, v0, v10

    const/16 v10, 0xa9

    const-string v11, "voices/mb/mb-us2"

    aput-object v11, v0, v10

    const/16 v10, 0xaa

    const-string v11, "voices/mb/mb-us3"

    aput-object v11, v0, v10

    .line 102
    .local v0, "datafiles":[Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 103
    .local v3, "espeakDataDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v2

    .line 105
    .local v2, "directoryExists":Z
    if-nez v2, :cond_40c

    .line 119
    :cond_40b
    :goto_40b
    return v8

    .line 108
    :cond_40c
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_40d
    array-length v10, v0

    if-lt v5, v10, :cond_412

    move v8, v9

    .line 119
    goto :goto_40b

    .line 109
    :cond_412
    new-instance v7, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v11, v0, v5

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    .local v7, "tempFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_452

    .line 111
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_431
    array-length v9, v0

    if-ge v6, v9, :cond_40b

    .line 112
    new-instance v1, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v10, v0, v6

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 113
    .local v1, "delFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 111
    add-int/lit8 v6, v6, 0x1

    goto :goto_431

    .line 108
    .end local v1    # "delFile":Ljava/io/File;
    .end local v6    # "j":I
    :cond_452
    add-int/lit8 v5, v5, 0x1

    goto :goto_40d
.end method

.method public static downloadEspeakData()V
    .registers 24

    .prologue
    .line 125
    :try_start_0
    new-instance v22, Ljava/io/File;

    const-string v23, "/sdcard/"

    invoke-direct/range {v22 .. v23}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v22}, Ljava/io/File;->canWrite()Z

    move-result v22

    if-nez v22, :cond_e

    .line 196
    .local v8, "espeakDataDir":Ljava/io/File;
    :cond_d
    :goto_d
    return-void

    .line 130
    .end local v8    # "espeakDataDir":Ljava/io/File;
    :cond_e
    new-instance v8, Ljava/io/File;

    const-string v22, "/sdcard/espeak-data/"

    move-object/from16 v0, v22

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 131
    .restart local v8    # "espeakDataDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->mkdir()Z

    .line 134
    const-string v9, "http://eyes-free.googlecode.com/svn/trunk/thirdparty/espeak-data.zip"

    .line 135
    .local v9, "fileUrl":Ljava/lang/String;
    new-instance v22, Ljava/net/URL;

    new-instance v23, Ljava/net/URL;

    move-object/from16 v0, v23

    invoke-direct {v0, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v9}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v9

    .line 136
    new-instance v19, Ljava/net/URL;

    move-object/from16 v0, v19

    invoke-direct {v0, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 137
    .local v19, "url":Ljava/net/URL;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 138
    .local v4, "cn":Ljava/net/URLConnection;
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 139
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v18

    .line 141
    .local v18, "stream":Ljava/io/InputStream;
    new-instance v5, Ljava/io/File;

    const-string v22, "/sdcard/espeak-data/data.zip"

    move-object/from16 v0, v22

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 142
    .local v5, "dlFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z

    .line 143
    new-instance v14, Ljava/io/FileOutputStream;

    invoke-direct {v14, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 145
    .local v14, "out":Ljava/io/FileOutputStream;
    const/16 v22, 0x4000

    move/from16 v0, v22

    new-array v3, v0, [B

    .line 147
    .local v3, "buf":[B
    :goto_59
    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v13

    .line 148
    .local v13, "numread":I
    if-gtz v13, :cond_b0

    .line 155
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V

    .line 156
    invoke-virtual {v14}, Ljava/io/FileOutputStream;->close()V

    .line 159
    new-instance v20, Ljava/util/zip/ZipFile;

    const-string v22, "/sdcard/espeak-data/data.zip"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 160
    .local v20, "zip":Ljava/util/zip/ZipFile;
    invoke-virtual/range {v20 .. v20}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v21

    .line 161
    .local v21, "zippedFiles":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_76
    invoke-interface/range {v21 .. v21}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v22

    if-eqz v22, :cond_d

    .line 162
    invoke-interface/range {v21 .. v21}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/zip/ZipEntry;

    .line 163
    .local v7, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v22

    if-eqz v22, :cond_b8

    .line 164
    new-instance v12, Ljava/io/File;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v12, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 165
    .local v12, "newDir":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->mkdir()Z
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_a9} :catch_aa

    goto :goto_76

    .line 193
    .end local v3    # "buf":[B
    .end local v4    # "cn":Ljava/net/URLConnection;
    .end local v5    # "dlFile":Ljava/io/File;
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    .end local v9    # "fileUrl":Ljava/lang/String;
    .end local v12    # "newDir":Ljava/io/File;
    .end local v13    # "numread":I
    .end local v14    # "out":Ljava/io/FileOutputStream;
    .end local v18    # "stream":Ljava/io/InputStream;
    .end local v19    # "url":Ljava/net/URL;
    .end local v20    # "zip":Ljava/util/zip/ZipFile;
    .end local v21    # "zippedFiles":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :catch_aa
    move-exception v6

    .line 194
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_d

    .line 151
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v3    # "buf":[B
    .restart local v4    # "cn":Ljava/net/URLConnection;
    .restart local v5    # "dlFile":Ljava/io/File;
    .restart local v9    # "fileUrl":Ljava/lang/String;
    .restart local v13    # "numread":I
    .restart local v14    # "out":Ljava/io/FileOutputStream;
    .restart local v18    # "stream":Ljava/io/InputStream;
    .restart local v19    # "url":Ljava/net/URL;
    :cond_b0
    const/16 v22, 0x0

    :try_start_b2
    move/from16 v0, v22

    invoke-virtual {v14, v3, v0, v13}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_59

    .line 167
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v20    # "zip":Ljava/util/zip/ZipFile;
    .restart local v21    # "zippedFiles":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_b8
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v10

    .line 168
    .local v10, "is":Ljava/io/InputStream;
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    .line 169
    .local v11, "name":Ljava/lang/String;
    new-instance v16, Ljava/io/File;

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "/sdcard/espeak-data/"

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 170
    .local v16, "outputFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v17

    .line 171
    .local v17, "outputPath":Ljava/lang/String;
    const-string v22, "/"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v22

    add-int/lit8 v22, v22, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 172
    const/16 v22, 0x0

    const-string v23, "/"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v23

    move-object/from16 v0, v17

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    .line 173
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 174
    .local v15, "outputDir":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->mkdirs()Z

    .line 175
    new-instance v16, Ljava/io/File;

    .end local v16    # "outputFile":Ljava/io/File;
    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .restart local v16    # "outputFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->createNewFile()Z

    .line 177
    new-instance v14, Ljava/io/FileOutputStream;

    .end local v14    # "out":Ljava/io/FileOutputStream;
    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 179
    .restart local v14    # "out":Ljava/io/FileOutputStream;
    const/16 v22, 0x4000

    move/from16 v0, v22

    new-array v3, v0, [B

    .line 181
    :goto_12d
    invoke-virtual {v10, v3}, Ljava/io/InputStream;->read([B)I

    move-result v13

    .line 182
    if-gtz v13, :cond_13b

    .line 189
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 190
    invoke-virtual {v14}, Ljava/io/FileOutputStream;->close()V

    goto/16 :goto_76

    .line 185
    :cond_13b
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v14, v3, v0, v13}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_142
    .catch Ljava/io/IOException; {:try_start_b2 .. :try_end_142} :catch_aa

    goto :goto_12d
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 43
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 44
    invoke-static {}, Lcom/google/tts/ConfigurationManager;->allFilesExist()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 45
    const/high16 v1, 0x7f030000

    invoke-virtual {p0, v1}, Lcom/google/tts/ConfigurationManager;->setContentView(I)V

    .line 46
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/google/tts/ConfigurationManager$dataDownloader;

    invoke-direct {v2, p0}, Lcom/google/tts/ConfigurationManager$dataDownloader;-><init>(Lcom/google/tts/ConfigurationManager;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 52
    :goto_1b
    return-void

    .line 48
    :cond_1c
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/tts/PrefsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 49
    .local v0, "intent":Landroid/content/Intent;
    const/16 v1, 0x2a

    invoke-virtual {p0, v0, v1}, Lcom/google/tts/ConfigurationManager;->startActivityForResult(Landroid/content/Intent;I)V

    .line 50
    invoke-virtual {p0}, Lcom/google/tts/ConfigurationManager;->finish()V

    goto :goto_1b
.end method
