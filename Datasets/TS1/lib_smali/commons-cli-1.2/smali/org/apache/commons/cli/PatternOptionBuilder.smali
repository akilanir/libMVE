.class public Lorg/apache/commons/cli/PatternOptionBuilder;
.super Ljava/lang/Object;
.source "PatternOptionBuilder.java"


# static fields
.field public static final CLASS_VALUE:Ljava/lang/Class;

.field public static final DATE_VALUE:Ljava/lang/Class;

.field public static final EXISTING_FILE_VALUE:Ljava/lang/Class;

.field public static final FILES_VALUE:Ljava/lang/Class;

.field public static final FILE_VALUE:Ljava/lang/Class;

.field public static final NUMBER_VALUE:Ljava/lang/Class;

.field public static final OBJECT_VALUE:Ljava/lang/Class;

.field public static final STRING_VALUE:Ljava/lang/Class;

.field public static final URL_VALUE:Ljava/lang/Class;

.field static array$Ljava$io$File:Ljava/lang/Class;

.field static class$java$io$File:Ljava/lang/Class;

.field static class$java$io$FileInputStream:Ljava/lang/Class;

.field static class$java$lang$Class:Ljava/lang/Class;

.field static class$java$lang$Number:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$java$net$URL:Ljava/lang/Class;

.field static class$java$util$Date:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 58
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_7f

    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$String:Ljava/lang/Class;

    :goto_c
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->STRING_VALUE:Ljava/lang/Class;

    .line 61
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_82

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Object:Ljava/lang/Class;

    :goto_1a
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->OBJECT_VALUE:Ljava/lang/Class;

    .line 64
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v0, :cond_85

    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Number:Ljava/lang/Class;

    :goto_28
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->NUMBER_VALUE:Ljava/lang/Class;

    .line 67
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$util$Date:Ljava/lang/Class;

    if-nez v0, :cond_88

    const-string v0, "java.util.Date"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$util$Date:Ljava/lang/Class;

    :goto_36
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->DATE_VALUE:Ljava/lang/Class;

    .line 70
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Class:Ljava/lang/Class;

    if-nez v0, :cond_8b

    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Class:Ljava/lang/Class;

    :goto_44
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->CLASS_VALUE:Ljava/lang/Class;

    .line 77
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$FileInputStream:Ljava/lang/Class;

    if-nez v0, :cond_8e

    const-string v0, "java.io.FileInputStream"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$FileInputStream:Ljava/lang/Class;

    :goto_52
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->EXISTING_FILE_VALUE:Ljava/lang/Class;

    .line 80
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$File:Ljava/lang/Class;

    if-nez v0, :cond_91

    const-string v0, "java.io.File"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$File:Ljava/lang/Class;

    :goto_60
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILE_VALUE:Ljava/lang/Class;

    .line 83
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->array$Ljava$io$File:Ljava/lang/Class;

    if-nez v0, :cond_94

    const-string v0, "[Ljava.io.File;"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->array$Ljava$io$File:Ljava/lang/Class;

    :goto_6e
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILES_VALUE:Ljava/lang/Class;

    .line 86
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$net$URL:Ljava/lang/Class;

    if-nez v0, :cond_97

    const-string v0, "java.net.URL"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$net$URL:Ljava/lang/Class;

    :goto_7c
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->URL_VALUE:Ljava/lang/Class;

    return-void

    .line 58
    :cond_7f
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_c

    .line 61
    :cond_82
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_1a

    .line 64
    :cond_85
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_28

    .line 67
    :cond_88
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$util$Date:Ljava/lang/Class;

    goto :goto_36

    .line 70
    :cond_8b
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Class:Ljava/lang/Class;

    goto :goto_44

    .line 77
    :cond_8e
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$FileInputStream:Ljava/lang/Class;

    goto :goto_52

    .line 80
    :cond_91
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$File:Ljava/lang/Class;

    goto :goto_60

    .line 83
    :cond_94
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->array$Ljava$io$File:Ljava/lang/Class;

    goto :goto_6e

    .line 86
    :cond_97
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$net$URL:Ljava/lang/Class;

    goto :goto_7c
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 58
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static getValueClass(C)Ljava/lang/Object;
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 96
    sparse-switch p0, :sswitch_data_20

    .line 118
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 99
    :sswitch_5
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->OBJECT_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 101
    :sswitch_8
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->STRING_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 103
    :sswitch_b
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->NUMBER_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 105
    :sswitch_e
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->CLASS_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 107
    :sswitch_11
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->DATE_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 109
    :sswitch_14
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->EXISTING_FILE_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 111
    :sswitch_17
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILE_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 113
    :sswitch_1a
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILES_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 115
    :sswitch_1d
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->URL_VALUE:Ljava/lang/Class;

    goto :goto_4

    .line 96
    :sswitch_data_20
    .sparse-switch
        0x23 -> :sswitch_11
        0x25 -> :sswitch_b
        0x2a -> :sswitch_1a
        0x2b -> :sswitch_e
        0x2f -> :sswitch_1d
        0x3a -> :sswitch_8
        0x3c -> :sswitch_14
        0x3e -> :sswitch_17
        0x40 -> :sswitch_5
    .end sparse-switch
.end method

.method public static isValueCode(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 130
    const/16 v0, 0x40

    if-eq p0, v0, :cond_28

    const/16 v0, 0x3a

    if-eq p0, v0, :cond_28

    const/16 v0, 0x25

    if-eq p0, v0, :cond_28

    const/16 v0, 0x2b

    if-eq p0, v0, :cond_28

    const/16 v0, 0x23

    if-eq p0, v0, :cond_28

    const/16 v0, 0x3c

    if-eq p0, v0, :cond_28

    const/16 v0, 0x3e

    if-eq p0, v0, :cond_28

    const/16 v0, 0x2a

    if-eq p0, v0, :cond_28

    const/16 v0, 0x2f

    if-eq p0, v0, :cond_28

    const/16 v0, 0x21

    if-ne p0, v0, :cond_2a

    :cond_28
    const/4 v0, 0x1

    :goto_29
    return v0

    :cond_2a
    const/4 v0, 0x0

    goto :goto_29
.end method

.method public static parsePattern(Ljava/lang/String;)Lorg/apache/commons/cli/Options;
    .registers 11
    .param p0, "pattern"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x20

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 150
    const/16 v2, 0x20

    .line 151
    .local v2, "opt":C
    const/4 v4, 0x0

    .line 152
    .local v4, "required":Z
    const/4 v5, 0x0

    .line 154
    .local v5, "type":Ljava/lang/Object;
    new-instance v3, Lorg/apache/commons/cli/Options;

    invoke-direct {v3}, Lorg/apache/commons/cli/Options;-><init>()V

    .line 156
    .local v3, "options":Lorg/apache/commons/cli/Options;
    const/4 v1, 0x0

    .end local v5    # "type":Ljava/lang/Object;
    .local v1, "i":I
    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_48

    .line 158
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 162
    .local v0, "ch":C
    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->isValueCode(C)Z

    move-result v6

    if-nez v6, :cond_3d

    .line 164
    if-eq v2, v9, :cond_37

    .line 166
    if-eqz v5, :cond_3b

    move v6, v7

    :goto_23
    invoke-static {v6}, Lorg/apache/commons/cli/OptionBuilder;->hasArg(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 167
    invoke-static {v4}, Lorg/apache/commons/cli/OptionBuilder;->isRequired(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 168
    invoke-static {v5}, Lorg/apache/commons/cli/OptionBuilder;->withType(Ljava/lang/Object;)Lorg/apache/commons/cli/OptionBuilder;

    .line 171
    invoke-static {v2}, Lorg/apache/commons/cli/OptionBuilder;->create(C)Lorg/apache/commons/cli/Option;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 172
    const/4 v4, 0x0

    .line 173
    const/4 v5, 0x0

    .line 174
    .restart local v5    # "type":Ljava/lang/Object;
    const/16 v2, 0x20

    .line 177
    .end local v5    # "type":Ljava/lang/Object;
    :cond_37
    move v2, v0

    .line 156
    :goto_38
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_3b
    move v6, v8

    .line 166
    goto :goto_23

    .line 179
    :cond_3d
    const/16 v6, 0x21

    if-ne v0, v6, :cond_43

    .line 181
    const/4 v4, 0x1

    goto :goto_38

    .line 185
    :cond_43
    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->getValueClass(C)Ljava/lang/Object;

    move-result-object v5

    .restart local v5    # "type":Ljava/lang/Object;
    goto :goto_38

    .line 189
    .end local v0    # "ch":C
    .end local v5    # "type":Ljava/lang/Object;
    :cond_48
    if-eq v2, v9, :cond_5c

    .line 191
    if-eqz v5, :cond_5d

    :goto_4c
    invoke-static {v7}, Lorg/apache/commons/cli/OptionBuilder;->hasArg(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 192
    invoke-static {v4}, Lorg/apache/commons/cli/OptionBuilder;->isRequired(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 193
    invoke-static {v5}, Lorg/apache/commons/cli/OptionBuilder;->withType(Ljava/lang/Object;)Lorg/apache/commons/cli/OptionBuilder;

    .line 196
    invoke-static {v2}, Lorg/apache/commons/cli/OptionBuilder;->create(C)Lorg/apache/commons/cli/Option;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 199
    :cond_5c
    return-object v3

    :cond_5d
    move v7, v8

    .line 191
    goto :goto_4c
.end method
