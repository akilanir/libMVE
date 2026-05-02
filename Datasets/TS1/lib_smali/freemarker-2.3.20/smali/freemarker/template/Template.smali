.class public Lfreemarker/template/Template;
.super Lfreemarker/core/Configurable;
.source "Template.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/Template$WrongEncodingException;,
        Lfreemarker/template/Template$LineTableBuilder;
    }
.end annotation


# static fields
.field public static final DEFAULT_NAMESPACE_PREFIX:Ljava/lang/String; = "D"

.field public static final NO_NS_PREFIX:Ljava/lang/String; = "N"


# instance fields
.field private actualTagSyntax:I

.field private defaultNS:Ljava/lang/String;

.field private encoding:Ljava/lang/String;

.field private imports:Ljava/util/List;

.field private final lines:Ljava/util/ArrayList;

.field private macros:Ljava/util/Map;

.field private final name:Ljava/lang/String;

.field private namespaceURIToPrefixLookup:Ljava/util/Map;

.field private transient parser:Lfreemarker/core/FMParser;

.field private prefixToNamespaceURILookup:Ljava/util/Map;

.field private rootElement:Lfreemarker/core/TemplateElement;


# direct methods
.method constructor <init>(Ljava/lang/String;Lfreemarker/core/TemplateElement;Lfreemarker/template/Configuration;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "root"    # Lfreemarker/core/TemplateElement;
    .param p3, "config"    # Lfreemarker/template/Configuration;

    .prologue
    .line 233
    invoke-direct {p0, p1, p3}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Lfreemarker/template/Configuration;)V

    .line 234
    iput-object p2, p0, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    .line 235
    invoke-static {p0}, Lfreemarker/debug/impl/DebuggerService;->registerTemplate(Lfreemarker/template/Template;)V

    .line 236
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lfreemarker/template/Configuration;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cfg"    # Lfreemarker/template/Configuration;

    .prologue
    .line 125
    if-eqz p2, :cond_2b

    .end local p2    # "cfg":Lfreemarker/template/Configuration;
    :goto_2
    invoke-direct {p0, p2}, Lfreemarker/core/Configurable;-><init>(Lfreemarker/core/Configurable;)V

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Template;->macros:Ljava/util/Map;

    .line 110
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Template;->imports:Ljava/util/List;

    .line 115
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Template;->lines:Ljava/util/ArrayList;

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Template;->prefixToNamespaceURILookup:Ljava/util/Map;

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Template;->namespaceURIToPrefixLookup:Ljava/util/Map;

    .line 126
    iput-object p1, p0, Lfreemarker/template/Template;->name:Ljava/lang/String;

    .line 127
    return-void

    .line 125
    .restart local p2    # "cfg":Lfreemarker/template/Configuration;
    :cond_2b
    invoke-static {}, Lfreemarker/template/Configuration;->getDefaultConfiguration()Lfreemarker/template/Configuration;

    move-result-object p2

    goto :goto_2
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/Reader;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;)V

    .line 227
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "reader"    # Ljava/io/Reader;
    .param p3, "cfg"    # Lfreemarker/template/Configuration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;Ljava/lang/String;)V

    .line 153
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;Ljava/lang/String;)V
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "reader"    # Ljava/io/Reader;
    .param p3, "cfg"    # Lfreemarker/template/Configuration;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    invoke-direct {p0, p1, p3}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Lfreemarker/template/Configuration;)V

    .line 180
    iput-object p4, p0, Lfreemarker/template/Template;->encoding:Ljava/lang/String;

    .line 182
    :try_start_5
    instance-of v0, p2, Ljava/io/BufferedReader;

    if-nez v0, :cond_87

    .line 183
    new-instance v9, Ljava/io/BufferedReader;

    const/16 v0, 0x1000

    invoke-direct {v9, p2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_10
    .catch Lfreemarker/core/ParseException; {:try_start_5 .. :try_end_10} :catch_77
    .catchall {:try_start_5 .. :try_end_10} :catchall_7c

    .line 185
    .end local p2    # "reader":Ljava/io/Reader;
    .local v9, "reader":Ljava/io/Reader;
    :goto_10
    :try_start_10
    new-instance p2, Lfreemarker/template/Template$LineTableBuilder;

    invoke-direct {p2, p0, v9}, Lfreemarker/template/Template$LineTableBuilder;-><init>(Lfreemarker/template/Template;Ljava/io/Reader;)V
    :try_end_15
    .catch Lfreemarker/core/ParseException; {:try_start_10 .. :try_end_15} :catch_84
    .catchall {:try_start_10 .. :try_end_15} :catchall_81

    .line 188
    .end local v9    # "reader":Ljava/io/Reader;
    .restart local p2    # "reader":Ljava/io/Reader;
    :try_start_15
    new-instance v0, Lfreemarker/core/FMParser;

    invoke-virtual {p0}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/template/Configuration;->getStrictSyntaxMode()Z

    move-result v3

    invoke-virtual {p0}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/template/Configuration;->getWhitespaceStripping()Z

    move-result v4

    invoke-virtual {p0}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/template/Configuration;->getTagSyntax()I

    move-result v5

    invoke-virtual {p0}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/template/Configuration;->getIncompatibleImprovements()Lfreemarker/template/Version;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/template/Version;->intValue()I

    move-result v6

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZII)V

    iput-object v0, p0, Lfreemarker/template/Template;->parser:Lfreemarker/core/FMParser;

    .line 193
    iget-object v0, p0, Lfreemarker/template/Template;->parser:Lfreemarker/core/FMParser;

    invoke-virtual {v0}, Lfreemarker/core/FMParser;->Root()Lfreemarker/core/TemplateElement;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    .line 194
    iget-object v0, p0, Lfreemarker/template/Template;->parser:Lfreemarker/core/FMParser;

    invoke-virtual {v0}, Lfreemarker/core/FMParser;->_getLastTagSyntax()I

    move-result v0

    iput v0, p0, Lfreemarker/template/Template;->actualTagSyntax:I
    :try_end_52
    .catch Lfreemarker/core/TokenMgrError; {:try_start_15 .. :try_end_52} :catch_6c
    .catchall {:try_start_15 .. :try_end_52} :catchall_72

    .line 202
    const/4 v0, 0x0

    :try_start_53
    iput-object v0, p0, Lfreemarker/template/Template;->parser:Lfreemarker/core/FMParser;
    :try_end_55
    .catch Lfreemarker/core/ParseException; {:try_start_53 .. :try_end_55} :catch_77
    .catchall {:try_start_53 .. :try_end_55} :catchall_7c

    .line 210
    invoke-virtual {p2}, Ljava/io/Reader;->close()V

    .line 212
    invoke-static {p0}, Lfreemarker/debug/impl/DebuggerService;->registerTemplate(Lfreemarker/template/Template;)V

    .line 213
    iget-object v0, p0, Lfreemarker/template/Template;->namespaceURIToPrefixLookup:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Template;->namespaceURIToPrefixLookup:Ljava/util/Map;

    .line 214
    iget-object v0, p0, Lfreemarker/template/Template;->prefixToNamespaceURILookup:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Template;->prefixToNamespaceURILookup:Ljava/util/Map;

    .line 215
    return-void

    .line 196
    :catch_6c
    move-exception v8

    .line 199
    .local v8, "exc":Lfreemarker/core/TokenMgrError;
    :try_start_6d
    invoke-virtual {v8, p0}, Lfreemarker/core/TokenMgrError;->toParseException(Lfreemarker/template/Template;)Lfreemarker/core/ParseException;

    move-result-object v0

    throw v0
    :try_end_72
    .catchall {:try_start_6d .. :try_end_72} :catchall_72

    .line 202
    .end local v8    # "exc":Lfreemarker/core/TokenMgrError;
    :catchall_72
    move-exception v0

    const/4 v1, 0x0

    :try_start_74
    iput-object v1, p0, Lfreemarker/template/Template;->parser:Lfreemarker/core/FMParser;

    throw v0
    :try_end_77
    .catch Lfreemarker/core/ParseException; {:try_start_74 .. :try_end_77} :catch_77
    .catchall {:try_start_74 .. :try_end_77} :catchall_7c

    .line 205
    :catch_77
    move-exception v7

    .line 206
    .local v7, "e":Lfreemarker/core/ParseException;
    :goto_78
    :try_start_78
    invoke-virtual {v7, p1}, Lfreemarker/core/ParseException;->setTemplateName(Ljava/lang/String;)V

    .line 207
    throw v7
    :try_end_7c
    .catchall {:try_start_78 .. :try_end_7c} :catchall_7c

    .line 210
    .end local v7    # "e":Lfreemarker/core/ParseException;
    :catchall_7c
    move-exception v0

    :goto_7d
    invoke-virtual {p2}, Ljava/io/Reader;->close()V

    throw v0

    .end local p2    # "reader":Ljava/io/Reader;
    .restart local v9    # "reader":Ljava/io/Reader;
    :catchall_81
    move-exception v0

    move-object p2, v9

    .end local v9    # "reader":Ljava/io/Reader;
    .restart local p2    # "reader":Ljava/io/Reader;
    goto :goto_7d

    .line 205
    .end local p2    # "reader":Ljava/io/Reader;
    .restart local v9    # "reader":Ljava/io/Reader;
    :catch_84
    move-exception v7

    move-object p2, v9

    .end local v9    # "reader":Ljava/io/Reader;
    .restart local p2    # "reader":Ljava/io/Reader;
    goto :goto_78

    :cond_87
    move-object v9, p2

    .end local p2    # "reader":Ljava/io/Reader;
    .restart local v9    # "reader":Ljava/io/Reader;
    goto :goto_10
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lfreemarker/template/Configuration;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sourceCode"    # Ljava/lang/String;
    .param p3, "cfg"    # Lfreemarker/template/Configuration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p3, v1}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;Ljava/lang/String;)V

    .line 161
    return-void
.end method

.method static access$000(Lfreemarker/template/Template;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lfreemarker/template/Template;

    .prologue
    .line 101
    iget-object v0, p0, Lfreemarker/template/Template;->lines:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getPlainTextTemplate(Ljava/lang/String;Ljava/lang/String;Lfreemarker/template/Configuration;)Lfreemarker/template/Template;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "config"    # Lfreemarker/template/Configuration;

    .prologue
    .line 248
    new-instance v1, Lfreemarker/template/Template;

    invoke-direct {v1, p0, p2}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Lfreemarker/template/Configuration;)V

    .line 249
    .local v1, "template":Lfreemarker/template/Template;
    new-instance v0, Lfreemarker/core/TextBlock;

    invoke-direct {v0, p1}, Lfreemarker/core/TextBlock;-><init>(Ljava/lang/String;)V

    .line 250
    .local v0, "block":Lfreemarker/core/TextBlock;
    iput-object v0, v1, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    .line 251
    invoke-static {v1}, Lfreemarker/debug/impl/DebuggerService;->registerTemplate(Lfreemarker/template/Template;)V

    .line 252
    return-object v1
.end method


# virtual methods
.method public addImport(Lfreemarker/core/LibraryLoad;)V
    .registers 3
    .param p1, "ll"    # Lfreemarker/core/LibraryLoad;

    .prologue
    .line 500
    iget-object v0, p0, Lfreemarker/template/Template;->imports:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 501
    return-void
.end method

.method public addMacro(Lfreemarker/core/Macro;)V
    .registers 4
    .param p1, "macro"    # Lfreemarker/core/Macro;

    .prologue
    .line 492
    iget-object v0, p0, Lfreemarker/template/Template;->macros:Ljava/util/Map;

    invoke-virtual {p1}, Lfreemarker/core/Macro;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    return-void
.end method

.method public addPrefixNSMapping(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "nsURI"    # Ljava/lang/String;

    .prologue
    .line 619
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_e

    .line 620
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot map empty string URI"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 622
    :cond_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1c

    .line 623
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot map empty string prefix"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 625
    :cond_1c
    const-string v0, "N"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 626
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The prefix: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " cannot be registered, it\'s reserved for special internal use."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 628
    :cond_43
    iget-object v0, p0, Lfreemarker/template/Template;->prefixToNamespaceURILookup:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    .line 629
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The prefix: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' was repeated. This is illegal."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 631
    :cond_6a
    iget-object v0, p0, Lfreemarker/template/Template;->namespaceURIToPrefixLookup:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_91

    .line 632
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The namespace URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " cannot be mapped to 2 different prefixes."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 634
    :cond_91
    const-string v0, "D"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9c

    .line 635
    iput-object p2, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    .line 640
    :goto_9b
    return-void

    .line 637
    :cond_9c
    iget-object v0, p0, Lfreemarker/template/Template;->prefixToNamespaceURILookup:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    iget-object v0, p0, Lfreemarker/template/Template;->namespaceURIToPrefixLookup:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9b
.end method

.method public containingElements(II)Ljavax/swing/tree/TreePath;
    .registers 9
    .param p1, "column"    # I
    .param p2, "line"    # I

    .prologue
    .line 701
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 702
    .local v2, "elements":Ljava/util/ArrayList;
    iget-object v1, p0, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    .line 704
    .local v1, "element":Lfreemarker/core/TemplateElement;
    :goto_7
    invoke-virtual {v1, p1, p2}, Lfreemarker/core/TemplateElement;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 705
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 706
    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->children()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "enumeration":Ljava/util/Enumeration;
    :cond_14
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_28

    .line 707
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    .line 708
    .local v0, "elem":Lfreemarker/core/TemplateElement;
    invoke-virtual {v0, p1, p2}, Lfreemarker/core/TemplateElement;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 709
    move-object v1, v0

    .line 710
    goto :goto_7

    .line 715
    .end local v0    # "elem":Lfreemarker/core/TemplateElement;
    .end local v3    # "enumeration":Ljava/util/Enumeration;
    :cond_28
    if-eqz v2, :cond_30

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 716
    :cond_30
    const/4 v4, 0x0

    .line 718
    :goto_31
    return-object v4

    :cond_32
    new-instance v4, Ljavax/swing/tree/TreePath;

    invoke-virtual {v2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/swing/tree/TreePath;-><init>([Ljava/lang/Object;)V

    goto :goto_31
.end method

.method public createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;)Lfreemarker/core/Environment;
    .registers 4
    .param p1, "dataModel"    # Ljava/lang/Object;
    .param p2, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lfreemarker/template/Template;->createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;)Lfreemarker/core/Environment;

    move-result-object v0

    return-object v0
.end method

.method public createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;)Lfreemarker/core/Environment;
    .registers 9
    .param p1, "dataModel"    # Ljava/lang/Object;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "wrapper"    # Lfreemarker/template/ObjectWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    instance-of v2, p1, Lfreemarker/template/TemplateHashModel;

    if-eqz v2, :cond_d

    move-object v0, p1

    .line 363
    check-cast v0, Lfreemarker/template/TemplateHashModel;

    .line 387
    .local v0, "dataModelHash":Lfreemarker/template/TemplateHashModel;
    :goto_7
    new-instance v2, Lfreemarker/core/Environment;

    invoke-direct {v2, p0, v0, p2}, Lfreemarker/core/Environment;-><init>(Lfreemarker/template/Template;Lfreemarker/template/TemplateHashModel;Ljava/io/Writer;)V

    return-object v2

    .line 365
    .end local v0    # "dataModelHash":Lfreemarker/template/TemplateHashModel;
    :cond_d
    if-nez p3, :cond_13

    .line 366
    invoke-virtual {p0}, Lfreemarker/template/Template;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object p3

    .line 369
    :cond_13
    if-nez p1, :cond_1b

    .line 370
    new-instance v0, Lfreemarker/template/SimpleHash;

    invoke-direct {v0, p3}, Lfreemarker/template/SimpleHash;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .restart local v0    # "dataModelHash":Lfreemarker/template/TemplateHashModel;
    goto :goto_7

    .line 372
    .end local v0    # "dataModelHash":Lfreemarker/template/TemplateHashModel;
    :cond_1b
    invoke-interface {p3, p1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 373
    .local v1, "wrappedDataModel":Lfreemarker/template/TemplateModel;
    instance-of v2, v1, Lfreemarker/template/TemplateHashModel;

    if-eqz v2, :cond_27

    move-object v0, v1

    .line 374
    check-cast v0, Lfreemarker/template/TemplateHashModel;

    .restart local v0    # "dataModelHash":Lfreemarker/template/TemplateHashModel;
    goto :goto_7

    .line 375
    .end local v0    # "dataModelHash":Lfreemarker/template/TemplateHashModel;
    :cond_27
    if-nez v1, :cond_5c

    .line 376
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " converted "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " to null."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 379
    :cond_5c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " didn\'t convert "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " to a TemplateHashModel. Generally, you want to use a Map<String, Object> or a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "JavaBean as the root-map (aka. data-model) parameter. The Map key-s or JavaBean "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "property names will be the variable names in the template."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public dump(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 477
    iget-object v0, p0, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 478
    return-void
.end method

.method public dump(Ljava/io/Writer;)V
    .registers 3
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 484
    iget-object v0, p0, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 485
    return-void
.end method

.method public getActualTagSyntax()I
    .registers 2

    .prologue
    .line 470
    iget v0, p0, Lfreemarker/template/Template;->actualTagSyntax:I

    return v0
.end method

.method public getConfiguration()Lfreemarker/template/Configuration;
    .registers 2

    .prologue
    .line 444
    invoke-virtual {p0}, Lfreemarker/template/Template;->getParent()Lfreemarker/core/Configurable;

    move-result-object v0

    check-cast v0, Lfreemarker/template/Configuration;

    return-object v0
.end method

.method public getDefaultNS()Ljava/lang/String;
    .registers 2

    .prologue
    .line 643
    iget-object v0, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 461
    iget-object v0, p0, Lfreemarker/template/Template;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getImports()Ljava/util/List;
    .registers 2

    .prologue
    .line 612
    iget-object v0, p0, Lfreemarker/template/Template;->imports:Ljava/util/List;

    return-object v0
.end method

.method public getMacros()Ljava/util/Map;
    .registers 2

    .prologue
    .line 608
    iget-object v0, p0, Lfreemarker/template/Template;->macros:Ljava/util/Map;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 437
    iget-object v0, p0, Lfreemarker/template/Template;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 650
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 651
    iget-object v0, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    if-nez v0, :cond_f

    const-string v0, ""

    .line 653
    :goto_e
    return-object v0

    .line 651
    :cond_f
    iget-object v0, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    goto :goto_e

    .line 653
    :cond_12
    iget-object v0, p0, Lfreemarker/template/Template;->prefixToNamespaceURILookup:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_e
.end method

.method public getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "nsURI"    # Ljava/lang/String;

    .prologue
    .line 660
    if-nez p1, :cond_4

    .line 661
    const/4 v0, 0x0

    .line 669
    :goto_3
    return-object v0

    .line 663
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_14

    .line 664
    iget-object v0, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    if-nez v0, :cond_11

    const-string v0, ""

    goto :goto_3

    :cond_11
    const-string v0, "N"

    goto :goto_3

    .line 666
    :cond_14
    iget-object v0, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 667
    const-string v0, ""

    goto :goto_3

    .line 669
    :cond_1f
    iget-object v0, p0, Lfreemarker/template/Template;->namespaceURIToPrefixLookup:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_3
.end method

.method public getPrefixedName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "nsURI"    # Ljava/lang/String;

    .prologue
    .line 678
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_20

    .line 679
    :cond_8
    iget-object v1, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    if-eqz v1, :cond_1f

    .line 680
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "N:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 692
    .end local p1    # "localName":Ljava/lang/String;
    :cond_1f
    :goto_1f
    return-object p1

    .line 685
    .restart local p1    # "localName":Ljava/lang/String;
    :cond_20
    iget-object v1, p0, Lfreemarker/template/Template;->defaultNS:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 688
    invoke-virtual {p0, p2}, Lfreemarker/template/Template;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 689
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_30

    .line 690
    const/4 p1, 0x0

    goto :goto_1f

    .line 692
    :cond_30
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1f
.end method

.method public getRootTreeNode()Lfreemarker/core/TemplateElement;
    .registers 2

    .prologue
    .line 604
    iget-object v0, p0, Lfreemarker/template/Template;->rootElement:Lfreemarker/core/TemplateElement;

    return-object v0
.end method

.method public getSource(IIII)Ljava/lang/String;
    .registers 11
    .param p1, "beginColumn"    # I
    .param p2, "beginLine"    # I
    .param p3, "endColumn"    # I
    .param p4, "endLine"    # I

    .prologue
    const/4 v4, 0x1

    .line 516
    if-lt p2, v4, :cond_5

    if-ge p4, v4, :cond_7

    :cond_5
    const/4 v4, 0x0

    .line 533
    :goto_6
    return-object v4

    .line 519
    :cond_7
    add-int/lit8 p2, p2, -0x1

    .line 520
    add-int/lit8 p1, p1, -0x1

    .line 521
    add-int/lit8 p3, p3, -0x1

    .line 522
    add-int/lit8 p4, p4, -0x1

    .line 523
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 524
    .local v0, "buf":Ljava/lang/StringBuffer;
    move v1, p2

    .local v1, "i":I
    :goto_15
    if-gt v1, p4, :cond_2b

    .line 525
    iget-object v4, p0, Lfreemarker/template/Template;->lines:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_28

    .line 526
    iget-object v4, p0, Lfreemarker/template/Template;->lines:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 524
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 529
    :cond_2b
    iget-object v4, p0, Lfreemarker/template/Template;->lines:Ljava/util/ArrayList;

    invoke-virtual {v4, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    .line 530
    .local v2, "lastLineLength":I
    sub-int v4, v2, p3

    add-int/lit8 v3, v4, -0x1

    .line 531
    .local v3, "trailingCharsToDelete":I
    const/4 v4, 0x0

    invoke-virtual {v0, v4, p1}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 532
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 533
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_6
.end method

.method public process(Ljava/lang/Object;Ljava/io/Writer;)V
    .registers 4
    .param p1, "dataModel"    # Ljava/lang/Object;
    .param p2, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 277
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lfreemarker/template/Template;->createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;)Lfreemarker/core/Environment;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/core/Environment;->process()V

    .line 278
    return-void
.end method

.method public process(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;)V
    .registers 5
    .param p1, "dataModel"    # Ljava/lang/Object;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "wrapper"    # Lfreemarker/template/ObjectWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    invoke-virtual {p0, p1, p2, p3}, Lfreemarker/template/Template;->createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;)Lfreemarker/core/Environment;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/core/Environment;->process()V

    .line 311
    return-void
.end method

.method public process(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;Lfreemarker/template/TemplateNodeModel;)V
    .registers 6
    .param p1, "dataModel"    # Ljava/lang/Object;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "wrapper"    # Lfreemarker/template/ObjectWrapper;
    .param p4, "rootNode"    # Lfreemarker/template/TemplateNodeModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 294
    invoke-virtual {p0, p1, p2, p3}, Lfreemarker/template/Template;->createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;)Lfreemarker/core/Environment;

    move-result-object v0

    .line 295
    .local v0, "env":Lfreemarker/core/Environment;
    if-eqz p4, :cond_9

    .line 296
    invoke-virtual {v0, p4}, Lfreemarker/core/Environment;->setCurrentVisitorNode(Lfreemarker/template/TemplateNodeModel;)V

    .line 298
    :cond_9
    invoke-virtual {v0}, Lfreemarker/core/Environment;->process()V

    .line 299
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 454
    iput-object p1, p0, Lfreemarker/template/Template;->encoding:Ljava/lang/String;

    .line 455
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 405
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 407
    .local v1, "sw":Ljava/io/StringWriter;
    :try_start_5
    invoke-virtual {p0, v1}, Lfreemarker/template/Template;->dump(Ljava/io/Writer;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_d

    .line 411
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 408
    :catch_d
    move-exception v0

    .line 409
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
