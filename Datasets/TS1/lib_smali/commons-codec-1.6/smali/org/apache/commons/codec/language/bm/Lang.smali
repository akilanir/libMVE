.class public Lorg/apache/commons/codec/language/bm/Lang;
.super Ljava/lang/Object;
.source "Lang.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/codec/language/bm/Lang$1;,
        Lorg/apache/commons/codec/language/bm/Lang$LangRule;
    }
.end annotation


# static fields
.field private static final LANGUAGE_RULES_RN:Ljava/lang/String; = "org/apache/commons/codec/language/bm/lang.txt"

.field private static final Langs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/codec/language/bm/NameType;",
            "Lorg/apache/commons/codec/language/bm/Lang;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final languages:Lorg/apache/commons/codec/language/bm/Languages;

.field private final rules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/codec/language/bm/Lang$LangRule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    .line 98
    new-instance v4, Ljava/util/EnumMap;

    const-class v5, Lorg/apache/commons/codec/language/bm/NameType;

    invoke-direct {v4, v5}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    sput-object v4, Lorg/apache/commons/codec/language/bm/Lang;->Langs:Ljava/util/Map;

    .line 103
    invoke-static {}, Lorg/apache/commons/codec/language/bm/NameType;->values()[Lorg/apache/commons/codec/language/bm/NameType;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/commons/codec/language/bm/NameType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_f
    if-ge v1, v2, :cond_25

    aget-object v3, v0, v1

    .line 104
    .local v3, "s":Lorg/apache/commons/codec/language/bm/NameType;
    sget-object v4, Lorg/apache/commons/codec/language/bm/Lang;->Langs:Ljava/util/Map;

    const-string v5, "org/apache/commons/codec/language/bm/lang.txt"

    invoke-static {v3}, Lorg/apache/commons/codec/language/bm/Languages;->getInstance(Lorg/apache/commons/codec/language/bm/NameType;)Lorg/apache/commons/codec/language/bm/Languages;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/apache/commons/codec/language/bm/Lang;->loadFromResource(Ljava/lang/String;Lorg/apache/commons/codec/language/bm/Languages;)Lorg/apache/commons/codec/language/bm/Lang;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 106
    .end local v3    # "s":Lorg/apache/commons/codec/language/bm/NameType;
    :cond_25
    return-void
.end method

.method private constructor <init>(Ljava/util/List;Lorg/apache/commons/codec/language/bm/Languages;)V
    .registers 4
    .param p2, "languages"    # Lorg/apache/commons/codec/language/bm/Languages;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/codec/language/bm/Lang$LangRule;",
            ">;",
            "Lorg/apache/commons/codec/language/bm/Languages;",
            ")V"
        }
    .end annotation

    .prologue
    .line 197
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/codec/language/bm/Lang$LangRule;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/codec/language/bm/Lang;->rules:Ljava/util/List;

    .line 199
    iput-object p2, p0, Lorg/apache/commons/codec/language/bm/Lang;->languages:Lorg/apache/commons/codec/language/bm/Languages;

    .line 200
    return-void
.end method

.method public static instance(Lorg/apache/commons/codec/language/bm/NameType;)Lorg/apache/commons/codec/language/bm/Lang;
    .registers 2
    .param p0, "nameType"    # Lorg/apache/commons/codec/language/bm/NameType;

    .prologue
    .line 116
    sget-object v0, Lorg/apache/commons/codec/language/bm/Lang;->Langs:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/codec/language/bm/Lang;

    return-object v0
.end method

.method public static loadFromResource(Ljava/lang/String;Lorg/apache/commons/codec/language/bm/Languages;)Lorg/apache/commons/codec/language/bm/Lang;
    .registers 16
    .param p0, "languageRulesResourceName"    # Ljava/lang/String;
    .param p1, "languages"    # Lorg/apache/commons/codec/language/bm/Languages;

    .prologue
    .line 135
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v9, "rules":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/codec/language/bm/Lang$LangRule;>;"
    const-class v11, Lorg/apache/commons/codec/language/bm/Lang;

    invoke-virtual {v11}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 138
    .local v3, "lRulesIS":Ljava/io/InputStream;
    if-nez v3, :cond_19

    .line 139
    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Unable to resolve required resource:org/apache/commons/codec/language/bm/lang.txt"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 142
    :cond_19
    new-instance v10, Ljava/util/Scanner;

    const-string v11, "UTF-8"

    invoke-direct {v10, v3, v11}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 143
    .local v10, "scanner":Ljava/util/Scanner;
    const/4 v2, 0x0

    .line 144
    .local v2, "inExtendedComment":Z
    :cond_21
    :goto_21
    invoke-virtual {v10}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v11

    if-eqz v11, :cond_af

    .line 145
    invoke-virtual {v10}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v8

    .line 146
    .local v8, "rawLine":Ljava/lang/String;
    move-object v5, v8

    .line 148
    .local v5, "line":Ljava/lang/String;
    if-eqz v2, :cond_38

    .line 149
    const-string v11, "*/"

    invoke-virtual {v5, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_21

    .line 150
    const/4 v2, 0x0

    goto :goto_21

    .line 155
    :cond_38
    const-string v11, "/*"

    invoke-virtual {v5, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_42

    .line 156
    const/4 v2, 0x1

    goto :goto_21

    .line 159
    :cond_42
    const-string v11, "//"

    invoke-virtual {v5, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 160
    .local v1, "cmtI":I
    if-ltz v1, :cond_4f

    .line 162
    const/4 v11, 0x0

    invoke-virtual {v5, v11, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 166
    :cond_4f
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 168
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_21

    .line 173
    const-string v11, "\\s+"

    invoke-virtual {v5, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 176
    .local v6, "parts":[Ljava/lang/String;
    array-length v11, v6

    const/4 v12, 0x3

    if-eq v11, v12, :cond_82

    .line 178
    sget-object v11, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Warning: malformed line \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_21

    .line 182
    :cond_82
    const/4 v11, 0x0

    aget-object v11, v6, v11

    invoke-static {v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 183
    .local v7, "pattern":Ljava/util/regex/Pattern;
    const/4 v11, 0x1

    aget-object v11, v6, v11

    const-string v12, "\\+"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 184
    .local v4, "langs":[Ljava/lang/String;
    const/4 v11, 0x2

    aget-object v11, v6, v11

    const-string v12, "true"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 186
    .local v0, "accept":Z
    new-instance v11, Lorg/apache/commons/codec/language/bm/Lang$LangRule;

    new-instance v12, Ljava/util/HashSet;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const/4 v13, 0x0

    invoke-direct {v11, v7, v12, v0, v13}, Lorg/apache/commons/codec/language/bm/Lang$LangRule;-><init>(Ljava/util/regex/Pattern;Ljava/util/Set;ZLorg/apache/commons/codec/language/bm/Lang$1;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_21

    .line 191
    .end local v0    # "accept":Z
    .end local v1    # "cmtI":I
    .end local v4    # "langs":[Ljava/lang/String;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "parts":[Ljava/lang/String;
    .end local v7    # "pattern":Ljava/util/regex/Pattern;
    .end local v8    # "rawLine":Ljava/lang/String;
    :cond_af
    new-instance v11, Lorg/apache/commons/codec/language/bm/Lang;

    invoke-direct {v11, v9, p1}, Lorg/apache/commons/codec/language/bm/Lang;-><init>(Ljava/util/List;Lorg/apache/commons/codec/language/bm/Languages;)V

    return-object v11
.end method


# virtual methods
.method public guessLanguage(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 210
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/bm/Lang;->guessLanguages(Ljava/lang/String;)Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;

    move-result-object v0

    .line 211
    .local v0, "ls":Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
    invoke-virtual {v0}, Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;->isSingleton()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {v0}, Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;->getAny()Ljava/lang/String;

    move-result-object v1

    :goto_e
    return-object v1

    :cond_f
    const-string v1, "any"

    goto :goto_e
.end method

.method public guessLanguages(Ljava/lang/String;)Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
    .registers 8
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 222
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 225
    .local v4, "text":Ljava/lang/String;
    new-instance v1, Ljava/util/HashSet;

    iget-object v5, p0, Lorg/apache/commons/codec/language/bm/Lang;->languages:Lorg/apache/commons/codec/language/bm/Languages;

    invoke-virtual {v5}, Lorg/apache/commons/codec/language/bm/Languages;->getLanguages()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 226
    .local v1, "langs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v5, p0, Lorg/apache/commons/codec/language/bm/Lang;->rules:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/codec/language/bm/Lang$LangRule;

    .line 227
    .local v3, "rule":Lorg/apache/commons/codec/language/bm/Lang$LangRule;
    invoke-virtual {v3, v4}, Lorg/apache/commons/codec/language/bm/Lang$LangRule;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 229
    # getter for: Lorg/apache/commons/codec/language/bm/Lang$LangRule;->acceptOnMatch:Z
    invoke-static {v3}, Lorg/apache/commons/codec/language/bm/Lang$LangRule;->access$100(Lorg/apache/commons/codec/language/bm/Lang$LangRule;)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 231
    # getter for: Lorg/apache/commons/codec/language/bm/Lang$LangRule;->languages:Ljava/util/Set;
    invoke-static {v3}, Lorg/apache/commons/codec/language/bm/Lang$LangRule;->access$200(Lorg/apache/commons/codec/language/bm/Lang$LangRule;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    goto :goto_17

    .line 234
    :cond_37
    # getter for: Lorg/apache/commons/codec/language/bm/Lang$LangRule;->languages:Ljava/util/Set;
    invoke-static {v3}, Lorg/apache/commons/codec/language/bm/Lang$LangRule;->access$200(Lorg/apache/commons/codec/language/bm/Lang$LangRule;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    goto :goto_17

    .line 242
    .end local v3    # "rule":Lorg/apache/commons/codec/language/bm/Lang$LangRule;
    :cond_3f
    invoke-static {v1}, Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;->from(Ljava/util/Set;)Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;

    move-result-object v2

    .line 243
    .local v2, "ls":Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
    sget-object v5, Lorg/apache/commons/codec/language/bm/Languages;->NO_LANGUAGES:Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;

    invoke-virtual {v2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4d

    sget-object v2, Lorg/apache/commons/codec/language/bm/Languages;->ANY_LANGUAGE:Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;

    .end local v2    # "ls":Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
    :cond_4d
    return-object v2
.end method
