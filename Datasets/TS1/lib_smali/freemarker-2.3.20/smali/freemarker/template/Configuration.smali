.class public Lfreemarker/template/Configuration;
.super Lfreemarker/core/Configurable;
.source "Configuration.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final ANGLE_BRACKET_TAG_SYNTAX:I = 0x1

.field public static final AUTO_DETECT_TAG_SYNTAX:I = 0x0

.field public static final AUTO_IMPORT_KEY:Ljava/lang/String; = "auto_import"

.field public static final AUTO_INCLUDE_KEY:Ljava/lang/String; = "auto_include"

.field public static final CACHE_STORAGE_KEY:Ljava/lang/String; = "cache_storage"

.field public static final DEFAULT_ENCODING_KEY:Ljava/lang/String; = "default_encoding"

.field public static final DEFAULT_INCOMPATIBLE_ENHANCEMENTS:Ljava/lang/String;

.field public static final DEFAULT_INCOMPATIBLE_IMPROVEMENTS:Lfreemarker/template/Version;

.field public static final INCOMPATIBLE_ENHANCEMENTS:Ljava/lang/String; = "incompatible_enhancements"

.field public static final INCOMPATIBLE_IMPROVEMENTS:Ljava/lang/String; = "incompatible_improvements"

.field public static final LOCALIZED_LOOKUP_KEY:Ljava/lang/String; = "localized_lookup"

.field public static final PARSED_DEFAULT_INCOMPATIBLE_ENHANCEMENTS:I

.field public static final SQUARE_BRACKET_TAG_SYNTAX:I = 0x2

.field public static final STRICT_SYNTAX_KEY:Ljava/lang/String; = "strict_syntax"

.field public static final TAG_SYNTAX_KEY:Ljava/lang/String; = "tag_syntax"

.field public static final TEMPLATE_UPDATE_DELAY_KEY:Ljava/lang/String; = "template_update_delay"

.field public static final WHITESPACE_STRIPPING_KEY:Ljava/lang/String; = "whitespace_stripping"

.field static class$freemarker$template$Configuration:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field private static defaultConfig:Lfreemarker/template/Configuration;

.field private static version:Lfreemarker/template/Version;

.field private static versionNumber:Ljava/lang/String;

.field private static versionPropertiesLoaded:Z


# instance fields
.field private autoImportNsToTmpMap:Ljava/util/Map;

.field private autoImports:Ljava/util/ArrayList;

.field private autoIncludes:Ljava/util/ArrayList;

.field private cache:Lfreemarker/cache/TemplateCache;

.field private defaultEncoding:Ljava/lang/String;

.field private incompatibleImprovements:Lfreemarker/template/Version;

.field private localeToCharsetMap:Ljava/util/Map;

.field private volatile localizedLookup:Z

.field private sharedVariables:Ljava/util/HashMap;

.field private strictSyntax:Z

.field private tagSyntax:I

.field private whitespaceStripping:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 166
    new-instance v0, Lfreemarker/template/Version;

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/template/Version;-><init>(III)V

    sput-object v0, Lfreemarker/template/Configuration;->DEFAULT_INCOMPATIBLE_IMPROVEMENTS:Lfreemarker/template/Version;

    .line 168
    sget-object v0, Lfreemarker/template/Configuration;->DEFAULT_INCOMPATIBLE_IMPROVEMENTS:Lfreemarker/template/Version;

    invoke-virtual {v0}, Lfreemarker/template/Version;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lfreemarker/template/Configuration;->DEFAULT_INCOMPATIBLE_ENHANCEMENTS:Ljava/lang/String;

    .line 170
    sget-object v0, Lfreemarker/template/Configuration;->DEFAULT_INCOMPATIBLE_IMPROVEMENTS:Lfreemarker/template/Version;

    invoke-virtual {v0}, Lfreemarker/template/Version;->intValue()I

    move-result v0

    sput v0, Lfreemarker/template/Configuration;->PARSED_DEFAULT_INCOMPATIBLE_ENHANCEMENTS:I

    .line 172
    new-instance v0, Lfreemarker/template/Configuration;

    invoke-direct {v0}, Lfreemarker/template/Configuration;-><init>()V

    sput-object v0, Lfreemarker/template/Configuration;->defaultConfig:Lfreemarker/template/Configuration;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 195
    invoke-direct {p0}, Lfreemarker/core/Configurable;-><init>()V

    .line 179
    iput-boolean v1, p0, Lfreemarker/template/Configuration;->strictSyntax:Z

    .line 180
    iput-boolean v1, p0, Lfreemarker/template/Configuration;->localizedLookup:Z

    .line 181
    iput-boolean v1, p0, Lfreemarker/template/Configuration;->whitespaceStripping:Z

    .line 182
    sget-object v0, Lfreemarker/template/Configuration;->DEFAULT_INCOMPATIBLE_IMPROVEMENTS:Lfreemarker/template/Version;

    iput-object v0, p0, Lfreemarker/template/Configuration;->incompatibleImprovements:Lfreemarker/template/Version;

    .line 183
    iput v1, p0, Lfreemarker/template/Configuration;->tagSyntax:I

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    .line 189
    const-string v0, "file.encoding"

    invoke-static {v0}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Configuration;->defaultEncoding:Ljava/lang/String;

    .line 190
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newThreadSafeMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    .line 192
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    .line 193
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;

    .line 196
    new-instance v0, Lfreemarker/cache/TemplateCache;

    invoke-direct {v0}, Lfreemarker/cache/TemplateCache;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    .line 197
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0, p0}, Lfreemarker/cache/TemplateCache;->setConfiguration(Lfreemarker/template/Configuration;)V

    .line 198
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, v1, v2}, Lfreemarker/cache/TemplateCache;->setDelay(J)V

    .line 199
    invoke-direct {p0}, Lfreemarker/template/Configuration;->loadBuiltInSharedVariables()V

    .line 200
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 469
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

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private createTemplateCache(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V
    .registers 7
    .param p1, "loader"    # Lfreemarker/cache/TemplateLoader;
    .param p2, "storage"    # Lfreemarker/cache/CacheStorage;

    .prologue
    .line 386
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    .line 387
    .local v0, "oldCache":Lfreemarker/cache/TemplateCache;
    new-instance v1, Lfreemarker/cache/TemplateCache;

    invoke-direct {v1, p1, p2}, Lfreemarker/cache/TemplateCache;-><init>(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V

    iput-object v1, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    .line 388
    iget-object v1, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->getDelay()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lfreemarker/cache/TemplateCache;->setDelay(J)V

    .line 389
    iget-object v1, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v1, p0}, Lfreemarker/cache/TemplateCache;->setConfiguration(Lfreemarker/template/Configuration;)V

    .line 390
    iget-object v1, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    iget-boolean v2, p0, Lfreemarker/template/Configuration;->localizedLookup:Z

    invoke-virtual {v1, v2}, Lfreemarker/cache/TemplateCache;->setLocalizedLookup(Z)V

    .line 391
    return-void
.end method

.method public static getDefaultConfiguration()Lfreemarker/template/Configuration;
    .registers 1

    .prologue
    .line 345
    sget-object v0, Lfreemarker/template/Configuration;->defaultConfig:Lfreemarker/template/Configuration;

    return-object v0
.end method

.method private static getRequiredVersionProperty(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "vp"    # Ljava/util/Properties;
    .param p1, "properyName"    # Ljava/lang/String;

    .prologue
    .line 1243
    invoke-virtual {p0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1244
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_25

    .line 1245
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Version file is corrupt: \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\" property is missing."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1248
    :cond_25
    return-object v0
.end method

.method public static getVersion()Lfreemarker/template/Version;
    .registers 1

    .prologue
    .line 1185
    sget-boolean v0, Lfreemarker/template/Configuration;->versionPropertiesLoaded:Z

    if-nez v0, :cond_7

    invoke-static {}, Lfreemarker/template/Configuration;->loadVersionProperties()V

    .line 1186
    :cond_7
    sget-object v0, Lfreemarker/template/Configuration;->version:Lfreemarker/template/Version;

    return-object v0
.end method

.method public static getVersionNumber()Ljava/lang/String;
    .registers 1

    .prologue
    .line 1152
    sget-boolean v0, Lfreemarker/template/Configuration;->versionPropertiesLoaded:Z

    if-nez v0, :cond_7

    invoke-static {}, Lfreemarker/template/Configuration;->loadVersionProperties()V

    .line 1153
    :cond_7
    sget-object v0, Lfreemarker/template/Configuration;->versionNumber:Ljava/lang/String;

    return-object v0
.end method

.method private loadBuiltInSharedVariables()V
    .registers 4

    .prologue
    .line 218
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    const-string v1, "capture_output"

    new-instance v2, Lfreemarker/template/utility/CaptureOutput;

    invoke-direct {v2}, Lfreemarker/template/utility/CaptureOutput;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    const-string v1, "compress"

    sget-object v2, Lfreemarker/template/utility/StandardCompress;->INSTANCE:Lfreemarker/template/utility/StandardCompress;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    const-string v1, "html_escape"

    new-instance v2, Lfreemarker/template/utility/HtmlEscape;

    invoke-direct {v2}, Lfreemarker/template/utility/HtmlEscape;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    const-string v1, "normalize_newlines"

    new-instance v2, Lfreemarker/template/utility/NormalizeNewlines;

    invoke-direct {v2}, Lfreemarker/template/utility/NormalizeNewlines;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    const-string v1, "xml_escape"

    new-instance v2, Lfreemarker/template/utility/XmlEscape;

    invoke-direct {v2}, Lfreemarker/template/utility/XmlEscape;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    return-void
.end method

.method private static loadVersionProperties()V
    .registers 10

    .prologue
    .line 1191
    :try_start_0
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 1192
    .local v6, "vp":Ljava/util/Properties;
    sget-object v7, Lfreemarker/template/Configuration;->class$freemarker$template$Configuration:Ljava/lang/Class;

    if-nez v7, :cond_3f

    const-string v7, "freemarker.template.Configuration"

    invoke-static {v7}, Lfreemarker/template/Configuration;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lfreemarker/template/Configuration;->class$freemarker$template$Configuration:Ljava/lang/Class;

    :goto_11
    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const-string v8, "freemarker/version.properties"

    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 1194
    .local v4, "ins":Ljava/io/InputStream;
    if-nez v4, :cond_42

    .line 1195
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Version file is missing."

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_25} :catch_25

    .line 1226
    .end local v4    # "ins":Ljava/io/InputStream;
    :catch_25
    move-exception v2

    .line 1227
    .local v2, "e":Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Failed to load version file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1192
    .end local v2    # "e":Ljava/io/IOException;
    :cond_3f
    :try_start_3f
    sget-object v7, Lfreemarker/template/Configuration;->class$freemarker$template$Configuration:Ljava/lang/Class;
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_41} :catch_25

    goto :goto_11

    .line 1198
    .restart local v4    # "ins":Ljava/io/InputStream;
    :cond_42
    :try_start_42
    invoke-virtual {v6, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_9e

    .line 1200
    :try_start_45
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 1203
    const-string v7, "version"

    invoke-static {v6, v7}, Lfreemarker/template/Configuration;->getRequiredVersionProperty(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1204
    .local v5, "versionString":Ljava/lang/String;
    sput-object v5, Lfreemarker/template/Configuration;->versionNumber:Ljava/lang/String;

    .line 1208
    const-string v7, "buildTimestamp"

    invoke-static {v6, v7}, Lfreemarker/template/Configuration;->getRequiredVersionProperty(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1209
    .local v1, "buildDateStr":Ljava/lang/String;
    const-string v7, "Z"

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7c

    .line 1210
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v8, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "+0000"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_7b} :catch_25

    move-result-object v1

    .line 1213
    :cond_7c
    :try_start_7c
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v7, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_88
    .catch Ljava/text/ParseException; {:try_start_7c .. :try_end_88} :catch_a3
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_88} :catch_25

    move-result-object v0

    .line 1219
    .local v0, "buildDate":Ljava/util/Date;
    :goto_89
    :try_start_89
    const-string v7, "isGAECompliant"

    invoke-static {v6, v7}, Lfreemarker/template/Configuration;->getRequiredVersionProperty(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    .line 1221
    .local v3, "gaeCompliant":Ljava/lang/Boolean;
    new-instance v7, Lfreemarker/template/Version;

    invoke-direct {v7, v5, v3, v0}, Lfreemarker/template/Version;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/Date;)V

    sput-object v7, Lfreemarker/template/Configuration;->version:Lfreemarker/template/Version;

    .line 1223
    const/4 v7, 0x1

    sput-boolean v7, Lfreemarker/template/Configuration;->versionPropertiesLoaded:Z

    .line 1229
    return-void

    .line 1200
    .end local v0    # "buildDate":Ljava/util/Date;
    .end local v1    # "buildDateStr":Ljava/lang/String;
    .end local v3    # "gaeCompliant":Ljava/lang/Boolean;
    .end local v5    # "versionString":Ljava/lang/String;
    :catchall_9e
    move-exception v7

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    throw v7
    :try_end_a3
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_a3} :catch_25

    .line 1214
    .restart local v1    # "buildDateStr":Ljava/lang/String;
    .restart local v5    # "versionString":Ljava/lang/String;
    :catch_a3
    move-exception v2

    .line 1215
    .local v2, "e":Ljava/text/ParseException;
    const/4 v0, 0x0

    .restart local v0    # "buildDate":Ljava/util/Date;
    goto :goto_89
.end method

.method public static setDefaultConfiguration(Lfreemarker/template/Configuration;)V
    .registers 1
    .param p0, "config"    # Lfreemarker/template/Configuration;

    .prologue
    .line 357
    sput-object p0, Lfreemarker/template/Configuration;->defaultConfig:Lfreemarker/template/Configuration;

    .line 358
    return-void
.end method


# virtual methods
.method public declared-synchronized addAutoImport(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespaceVarName"    # Ljava/lang/String;
    .param p2, "templateName"    # Ljava/lang/String;

    .prologue
    .line 1066
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1067
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1068
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 1069
    monitor-exit p0

    return-void

    .line 1066
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addAutoInclude(Ljava/lang/String;)V
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 1119
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1120
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 1121
    monitor-exit p0

    return-void

    .line 1119
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearEncodingMap()V
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 327
    return-void
.end method

.method public clearSharedVariables()V
    .registers 2

    .prologue
    .line 897
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 898
    invoke-direct {p0}, Lfreemarker/template/Configuration;->loadBuiltInSharedVariables()V

    .line 899
    return-void
.end method

.method public clearTemplateCache()V
    .registers 2

    .prologue
    .line 907
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->clear()V

    .line 908
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 204
    :try_start_0
    invoke-super {p0}, Lfreemarker/core/Configurable;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/Configuration;

    .line 205
    .local v0, "copy":Lfreemarker/template/Configuration;
    new-instance v2, Ljava/util/HashMap;

    iget-object v3, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v2, v0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    .line 206
    new-instance v2, Ljava/util/HashMap;

    iget-object v3, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v2, v0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    .line 207
    new-instance v2, Ljava/util/HashMap;

    iget-object v3, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v2, v0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;

    .line 208
    iget-object v2, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    iput-object v2, v0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    .line 209
    iget-object v2, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    iput-object v2, v0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    .line 210
    iget-object v2, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v2}, Lfreemarker/cache/TemplateCache;->getTemplateLoader()Lfreemarker/cache/TemplateLoader;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v3}, Lfreemarker/cache/TemplateCache;->getCacheStorage()Lfreemarker/cache/CacheStorage;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lfreemarker/template/Configuration;->createTemplateCache(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V
    :try_end_44
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_44} :catch_45

    .line 211
    return-object v0

    .line 212
    .end local v0    # "copy":Lfreemarker/template/Configuration;
    :catch_45
    move-exception v1

    .line 213
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Clone is not supported, but it should be: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/CloneNotSupportedException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected doAutoImportsAndIncludes(Lfreemarker/core/Environment;)V
    .registers 7
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1102
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_1f

    .line 1103
    iget-object v4, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1104
    .local v1, "namespace":Ljava/lang/String;
    iget-object v4, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1105
    .local v3, "templateName":Ljava/lang/String;
    invoke-virtual {p1, v3, v1}, Lfreemarker/core/Environment;->importLib(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;

    .line 1102
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1107
    .end local v1    # "namespace":Ljava/lang/String;
    .end local v3    # "templateName":Ljava/lang/String;
    :cond_1f
    const/4 v0, 0x0

    :goto_20
    iget-object v4, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_3e

    .line 1108
    iget-object v4, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1109
    .restart local v3    # "templateName":Ljava/lang/String;
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;)Lfreemarker/template/Template;

    move-result-object v2

    .line 1110
    .local v2, "template":Lfreemarker/template/Template;
    invoke-virtual {p1, v2}, Lfreemarker/core/Environment;->include(Lfreemarker/template/Template;)V

    .line 1107
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 1112
    .end local v2    # "template":Lfreemarker/template/Template;
    .end local v3    # "templateName":Ljava/lang/String;
    :cond_3e
    return-void
.end method

.method public declared-synchronized getCacheStorage()Lfreemarker/cache/CacheStorage;
    .registers 2

    .prologue
    .line 421
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->getCacheStorage()Lfreemarker/cache/CacheStorage;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDefaultEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 767
    iget-object v0, p0, Lfreemarker/template/Configuration;->defaultEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getEncoding(Ljava/util/Locale;)Ljava/lang/String;
    .registers 6
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 777
    iget-object v2, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 778
    iget-object v0, p0, Lfreemarker/template/Configuration;->defaultEncoding:Ljava/lang/String;

    .line 795
    :cond_a
    :goto_a
    return-object v0

    .line 781
    :cond_b
    iget-object v2, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 782
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_5e

    .line 783
    invoke-virtual {p1}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_47

    .line 784
    new-instance v1, Ljava/util/Locale;

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    .local v1, "l":Ljava/util/Locale;
    iget-object v2, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "charset":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 786
    .restart local v0    # "charset":Ljava/lang/String;
    if-eqz v0, :cond_47

    .line 787
    iget-object v2, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 790
    .end local v1    # "l":Ljava/util/Locale;
    :cond_47
    iget-object v2, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "charset":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 791
    .restart local v0    # "charset":Ljava/lang/String;
    if-eqz v0, :cond_5e

    .line 792
    iget-object v2, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    :cond_5e
    if-nez v0, :cond_a

    iget-object v0, p0, Lfreemarker/template/Configuration;->defaultEncoding:Ljava/lang/String;

    goto :goto_a
.end method

.method public getIncompatibleEnhancements()Ljava/lang/String;
    .registers 2

    .prologue
    .line 584
    iget-object v0, p0, Lfreemarker/template/Configuration;->incompatibleImprovements:Lfreemarker/template/Version;

    invoke-virtual {v0}, Lfreemarker/template/Version;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIncompatibleImprovements()Lfreemarker/template/Version;
    .registers 2

    .prologue
    .line 570
    iget-object v0, p0, Lfreemarker/template/Configuration;->incompatibleImprovements:Lfreemarker/template/Version;

    return-object v0
.end method

.method public getLocalizedLookup()Z
    .registers 2

    .prologue
    .line 966
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->getLocalizedLookup()Z

    move-result v0

    return v0
.end method

.method public getParsedIncompatibleEnhancements()I
    .registers 2

    .prologue
    .line 591
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getIncompatibleImprovements()Lfreemarker/template/Version;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/template/Version;->intValue()I

    move-result v0

    return v0
.end method

.method public getSharedVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 890
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public getSharedVariableNames()Ljava/util/Set;
    .registers 3

    .prologue
    .line 840
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getStrictSyntaxMode()Z
    .registers 2

    .prologue
    .line 522
    iget-boolean v0, p0, Lfreemarker/template/Configuration;->strictSyntax:Z

    return v0
.end method

.method public getSupportedBuiltInNames()Ljava/util/Set;
    .registers 2

    .prologue
    .line 1239
    invoke-static {}, Lfreemarker/core/_CoreAPI;->getSupportedBuiltInNames()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getTagSyntax()I
    .registers 2

    .prologue
    .line 651
    iget v0, p0, Lfreemarker/template/Configuration;->tagSyntax:I

    return v0
.end method

.method public getTemplate(Ljava/lang/String;)Lfreemarker/template/Template;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 664
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getLocale()Ljava/util/Locale;

    move-result-object v0

    .line 665
    .local v0, "loc":Ljava/util/Locale;
    invoke-virtual {p0, v0}, Lfreemarker/template/Configuration;->getEncoding(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v1

    return-object v1
.end method

.method public getTemplate(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/Template;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 681
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getLocale()Ljava/util/Locale;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, p2, v1}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public getTemplate(Ljava/lang/String;Ljava/util/Locale;)Lfreemarker/template/Template;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    invoke-virtual {p0, p2}, Lfreemarker/template/Configuration;->getEncoding(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;)Lfreemarker/template/Template;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 689
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .param p4, "parseAsFTL"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 740
    iget-object v1, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v1, p1, p2, p3, p4}, Lfreemarker/cache/TemplateCache;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    .line 741
    .local v0, "result":Lfreemarker/template/Template;
    if-nez v0, :cond_2b

    .line 742
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Template "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 744
    :cond_2b
    return-object v0
.end method

.method public getTemplateLoader()Lfreemarker/cache/TemplateLoader;
    .registers 2

    .prologue
    .line 398
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->getTemplateLoader()Lfreemarker/cache/TemplateLoader;

    move-result-object v0

    return-object v0
.end method

.method public getWhitespaceStripping()Z
    .registers 2

    .prologue
    .line 609
    iget-boolean v0, p0, Lfreemarker/template/Configuration;->whitespaceStripping:Z

    return v0
.end method

.method public loadBuiltInEncodingMap()V
    .registers 4

    .prologue
    .line 278
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 279
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "ar"

    const-string v2, "ISO-8859-6"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "be"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "bg"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "ca"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "cs"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "da"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "de"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "el"

    const-string v2, "ISO-8859-7"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "en"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "es"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "et"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "fi"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "fr"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "hr"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "hu"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "is"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "it"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "iw"

    const-string v2, "ISO-8859-8"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "ja"

    const-string v2, "Shift_JIS"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "ko"

    const-string v2, "EUC-KR"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "lt"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "lv"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "mk"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "nl"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "no"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "pl"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "pt"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "ro"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "ru"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "sh"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "sk"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "sl"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "sq"

    const-string v2, "ISO-8859-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "sr"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "sv"

    const-string v2, "ISO-8859-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "tr"

    const-string v2, "ISO-8859-9"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "uk"

    const-string v2, "ISO-8859-5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "zh"

    const-string v2, "GB2312"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    const-string v1, "zh_TW"

    const-string v2, "Big5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    return-void
.end method

.method public declared-synchronized removeAutoImport(Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceVarName"    # Ljava/lang/String;

    .prologue
    .line 1076
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1077
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 1078
    monitor-exit p0

    return-void

    .line 1076
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeAutoInclude(Ljava/lang/String;)V
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 1143
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 1144
    monitor-exit p0

    return-void

    .line 1143
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeTemplateFromCache(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 915
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getLocale()Ljava/util/Locale;

    move-result-object v0

    .line 916
    .local v0, "loc":Ljava/util/Locale;
    invoke-virtual {p0, v0}, Lfreemarker/template/Configuration;->getEncoding(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lfreemarker/template/Configuration;->removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 917
    return-void
.end method

.method public removeTemplateFromCache(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 932
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getLocale()Ljava/util/Locale;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, p2, v1}, Lfreemarker/template/Configuration;->removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 933
    return-void
.end method

.method public removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 924
    invoke-virtual {p0, p2}, Lfreemarker/template/Configuration;->getEncoding(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lfreemarker/template/Configuration;->removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 925
    return-void
.end method

.method public removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 940
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lfreemarker/template/Configuration;->removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 941
    return-void
.end method

.method public removeTemplateFromCache(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .param p4, "parse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 957
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0, p1, p2, p3, p4}, Lfreemarker/cache/TemplateCache;->removeTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 958
    return-void
.end method

.method public setAllSharedVariables(Lfreemarker/template/TemplateHashModelEx;)V
    .registers 6
    .param p1, "hash"    # Lfreemarker/template/TemplateHashModelEx;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 869
    invoke-interface {p1}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v2

    invoke-interface {v2}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 870
    .local v0, "keys":Lfreemarker/template/TemplateModelIterator;
    invoke-interface {p1}, Lfreemarker/template/TemplateHashModelEx;->values()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v2

    invoke-interface {v2}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v1

    .line 871
    .local v1, "values":Lfreemarker/template/TemplateModelIterator;
    :goto_10
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 873
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v2}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lfreemarker/template/Configuration;->setSharedVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_10

    .line 875
    :cond_28
    return-void
.end method

.method public declared-synchronized setAutoImports(Ljava/util/Map;)V
    .registers 4
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 1087
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoImports:Ljava/util/ArrayList;

    .line 1088
    instance-of v0, p1, Ljava/util/HashMap;

    if-eqz v0, :cond_1c

    .line 1089
    check-cast p1, Ljava/util/HashMap;

    .end local p1    # "map":Ljava/util/Map;
    invoke-virtual {p1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_28

    .line 1097
    :goto_1a
    monitor-exit p0

    return-void

    .line 1091
    .restart local p1    # "map":Ljava/util/Map;
    :cond_1c
    :try_start_1c
    instance-of v0, p1, Ljava/util/SortedMap;

    if-eqz v0, :cond_2b

    .line 1092
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;
    :try_end_27
    .catchall {:try_start_1c .. :try_end_27} :catchall_28

    goto :goto_1a

    .line 1087
    .end local p1    # "map":Ljava/util/Map;
    :catchall_28
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1095
    .restart local p1    # "map":Ljava/util/Map;
    :cond_2b
    :try_start_2b
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lfreemarker/template/Configuration;->autoImportNsToTmpMap:Ljava/util/Map;
    :try_end_32
    .catchall {:try_start_2b .. :try_end_32} :catchall_28

    goto :goto_1a
.end method

.method public declared-synchronized setAutoIncludes(Ljava/util/List;)V
    .registers 6
    .param p1, "templateNames"    # Ljava/util/List;

    .prologue
    .line 1127
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1128
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1129
    .local v0, "it":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 1130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1131
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-nez v2, :cond_23

    .line 1132
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "List items must be String-s."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_20

    .line 1127
    .end local v0    # "it":Ljava/util/Iterator;
    .end local v1    # "o":Ljava/lang/Object;
    :catchall_20
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1134
    .restart local v0    # "it":Ljava/util/Iterator;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_23
    :try_start_23
    iget-object v2, p0, Lfreemarker/template/Configuration;->autoIncludes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_28
    .catchall {:try_start_23 .. :try_end_28} :catchall_20

    goto :goto_a

    .line 1136
    .end local v1    # "o":Ljava/lang/Object;
    :cond_29
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setCacheStorage(Lfreemarker/cache/CacheStorage;)V
    .registers 3
    .param p1, "storage"    # Lfreemarker/cache/CacheStorage;

    .prologue
    .line 412
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->getTemplateLoader()Lfreemarker/cache/TemplateLoader;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lfreemarker/template/Configuration;->createTemplateCache(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 413
    monitor-exit p0

    return-void

    .line 412
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setClassForTemplateLoading(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "pathPrefix"    # Ljava/lang/String;

    .prologue
    .line 490
    new-instance v0, Lfreemarker/cache/ClassTemplateLoader;

    invoke-direct {v0, p1, p2}, Lfreemarker/cache/ClassTemplateLoader;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lfreemarker/template/Configuration;->setTemplateLoader(Lfreemarker/cache/TemplateLoader;)V

    .line 491
    return-void
.end method

.method public setDefaultEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 758
    iput-object p1, p0, Lfreemarker/template/Configuration;->defaultEncoding:Ljava/lang/String;

    .line 759
    return-void
.end method

.method public setDirectoryForTemplateLoading(Ljava/io/File;)V
    .registers 5
    .param p1, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 433
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getTemplateLoader()Lfreemarker/cache/TemplateLoader;

    move-result-object v1

    .line 434
    .local v1, "tl":Lfreemarker/cache/TemplateLoader;
    instance-of v2, v1, Lfreemarker/cache/FileTemplateLoader;

    if-eqz v2, :cond_1b

    .line 435
    check-cast v1, Lfreemarker/cache/FileTemplateLoader;

    .end local v1    # "tl":Lfreemarker/cache/TemplateLoader;
    iget-object v2, v1, Lfreemarker/cache/FileTemplateLoader;->baseDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    .line 436
    .local v0, "path":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 440
    .end local v0    # "path":Ljava/lang/String;
    :goto_1a
    return-void

    .line 439
    :cond_1b
    new-instance v2, Lfreemarker/cache/FileTemplateLoader;

    invoke-direct {v2, p1}, Lfreemarker/cache/FileTemplateLoader;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v2}, Lfreemarker/template/Configuration;->setTemplateLoader(Lfreemarker/cache/TemplateLoader;)V

    goto :goto_1a
.end method

.method public setEncoding(Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 810
    iget-object v0, p0, Lfreemarker/template/Configuration;->localeToCharsetMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 811
    return-void
.end method

.method public setIncompatibleEnhancements(Ljava/lang/String;)V
    .registers 3
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 577
    new-instance v0, Lfreemarker/template/Version;

    invoke-direct {v0, p1}, Lfreemarker/template/Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lfreemarker/template/Configuration;->setIncompatibleImprovements(Lfreemarker/template/Version;)V

    .line 578
    return-void
.end method

.method public setIncompatibleImprovements(Lfreemarker/template/Version;)V
    .registers 2
    .param p1, "version"    # Lfreemarker/template/Version;

    .prologue
    .line 562
    iput-object p1, p0, Lfreemarker/template/Configuration;->incompatibleImprovements:Lfreemarker/template/Version;

    .line 563
    return-void
.end method

.method public setLocalizedLookup(Z)V
    .registers 3
    .param p1, "localizedLookup"    # Z

    .prologue
    .line 979
    iput-boolean p1, p0, Lfreemarker/template/Configuration;->localizedLookup:Z

    .line 980
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0, p1}, Lfreemarker/cache/TemplateCache;->setLocalizedLookup(Z)V

    .line 981
    return-void
.end method

.method public setServletContextForTemplateLoading(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 11
    .param p1, "servletContext"    # Ljava/lang/Object;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 458
    :try_start_0
    const-string v5, "freemarker.cache.WebappTemplateLoader"

    invoke-static {v5}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 461
    .local v4, "webappTemplateLoaderClass":Ljava/lang/Class;
    const-string v5, "javax.servlet.ServletContext"

    invoke-static {v5}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 465
    .local v3, "servletContextClass":Ljava/lang/Class;
    if-nez p2, :cond_28

    .line 466
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v3, v0, v5

    .line 467
    .local v0, "constructorParamTypes":[Ljava/lang/Class;
    const/4 v5, 0x1

    new-array v1, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v1, v5

    .line 473
    .local v1, "constructorParams":[Ljava/lang/Object;
    :goto_1a
    invoke-virtual {v4, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfreemarker/cache/TemplateLoader;

    invoke-virtual {p0, v5}, Lfreemarker/template/Configuration;->setTemplateLoader(Lfreemarker/cache/TemplateLoader;)V

    .line 480
    return-void

    .line 469
    .end local v0    # "constructorParamTypes":[Ljava/lang/Class;
    .end local v1    # "constructorParams":[Ljava/lang/Object;
    :cond_28
    const/4 v5, 0x2

    new-array v0, v5, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v3, v0, v5

    const/4 v6, 0x1

    sget-object v5, Lfreemarker/template/Configuration;->class$java$lang$String:Ljava/lang/Class;

    if-nez v5, :cond_47

    const-string v5, "java.lang.String"

    invoke-static {v5}, Lfreemarker/template/Configuration;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lfreemarker/template/Configuration;->class$java$lang$String:Ljava/lang/Class;

    :goto_3b
    aput-object v5, v0, v6

    .line 470
    .restart local v0    # "constructorParamTypes":[Ljava/lang/Class;
    const/4 v5, 0x2

    new-array v1, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v1, v5

    const/4 v5, 0x1

    aput-object p2, v1, v5

    .restart local v1    # "constructorParams":[Ljava/lang/Object;
    goto :goto_1a

    .line 469
    .end local v0    # "constructorParamTypes":[Ljava/lang/Class;
    .end local v1    # "constructorParams":[Ljava/lang/Object;
    :cond_47
    sget-object v5, Lfreemarker/template/Configuration;->class$java$lang$String:Ljava/lang/Class;
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_49} :catch_4a

    goto :goto_3b

    .line 477
    .end local v3    # "servletContextClass":Ljava/lang/Class;
    .end local v4    # "webappTemplateLoaderClass":Ljava/lang/Class;
    :catch_4a
    move-exception v2

    .line 478
    .local v2, "exc":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Internal FreeMarker error: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public setSetting(Ljava/lang/String;Ljava/lang/String;)V
    .registers 16
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 985
    :try_start_0
    const-string v8, "TemplateUpdateInterval"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_16

    .line 986
    const-string p1, "template_update_delay"

    .line 991
    :cond_a
    :goto_a
    const-string v8, "default_encoding"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    .line 992
    invoke-virtual {p0, p2}, Lfreemarker/template/Configuration;->setDefaultEncoding(Ljava/lang/String;)V

    .line 1059
    :goto_15
    return-void

    .line 987
    :cond_16
    const-string v8, "DefaultEncoding"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 988
    const-string p1, "default_encoding"

    goto :goto_a

    .line 993
    :cond_21
    const-string v8, "localized_lookup"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5e

    .line 994
    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setLocalizedLookup(Z)V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_30} :catch_31

    goto :goto_15

    .line 1054
    :catch_31
    move-exception v0

    .line 1055
    .local v0, "e":Ljava/lang/Exception;
    new-instance v8, Lfreemarker/core/_MiscTemplateException;

    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getEnvironment()Lfreemarker/core/Environment;

    move-result-object v9

    const/4 v10, 0x5

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "Failed to set setting "

    aput-object v12, v10, v11

    const/4 v11, 0x1

    new-instance v12, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v12, p1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const-string v12, " to value "

    aput-object v12, v10, v11

    const/4 v11, 0x3

    new-instance v12, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v12, p2}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v12, v10, v11

    const/4 v11, 0x4

    const-string v12, "; see cause exception."

    aput-object v12, v10, v11

    invoke-direct {v8, v0, v9, v10}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v8

    .line 995
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5e
    :try_start_5e
    const-string v8, "strict_syntax"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6e

    .line 996
    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setStrictSyntaxMode(Z)V

    goto :goto_15

    .line 997
    :cond_6e
    const-string v8, "whitespace_stripping"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7e

    .line 998
    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setWhitespaceStripping(Z)V

    goto :goto_15

    .line 999
    :cond_7e
    const-string v8, "cache_storage"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_101

    .line 1000
    const/16 v8, 0x2e

    invoke-virtual {p2, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_f2

    .line 1001
    const/4 v7, 0x0

    .line 1002
    .local v7, "strongSize":I
    const/4 v6, 0x0

    .line 1003
    .local v6, "softSize":I
    const v8, 0x7fffffff

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {p2, v8}, Lfreemarker/template/utility/StringUtil;->parseNameValuePairList(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 1005
    .local v3, "map":Ljava/util/Map;
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1006
    .local v2, "it":Ljava/util/Iterator;
    :goto_a4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_df

    .line 1007
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1008
    .local v1, "ent":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;
    :try_end_b6
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_b6} :catch_31

    .line 1011
    .local v4, "pname":Ljava/lang/String;
    :try_start_b6
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_bf
    .catch Ljava/lang/NumberFormatException; {:try_start_b6 .. :try_end_bf} :catch_ca
    .catch Ljava/lang/Exception; {:try_start_b6 .. :try_end_bf} :catch_31

    move-result v5

    .line 1015
    .local v5, "pvalue":I
    :try_start_c0
    const-string v8, "soft"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d0

    .line 1016
    move v6, v5

    goto :goto_a4

    .line 1012
    .end local v5    # "pvalue":I
    :catch_ca
    move-exception v0

    .line 1013
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0, p1, p2}, Lfreemarker/template/Configuration;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v8

    throw v8

    .line 1017
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v5    # "pvalue":I
    :cond_d0
    const-string v8, "strong"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_da

    .line 1018
    move v7, v5

    goto :goto_a4

    .line 1020
    :cond_da
    invoke-virtual {p0, p1, p2}, Lfreemarker/template/Configuration;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v8

    throw v8

    .line 1023
    .end local v1    # "ent":Ljava/util/Map$Entry;
    .end local v4    # "pname":Ljava/lang/String;
    .end local v5    # "pvalue":I
    :cond_df
    if-nez v6, :cond_e8

    if-nez v7, :cond_e8

    .line 1024
    invoke-virtual {p0, p1, p2}, Lfreemarker/template/Configuration;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v8

    throw v8

    .line 1026
    :cond_e8
    new-instance v8, Lfreemarker/cache/MruCacheStorage;

    invoke-direct {v8, v7, v6}, Lfreemarker/cache/MruCacheStorage;-><init>(II)V

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setCacheStorage(Lfreemarker/cache/CacheStorage;)V

    goto/16 :goto_15

    .line 1028
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v3    # "map":Ljava/util/Map;
    .end local v6    # "softSize":I
    .end local v7    # "strongSize":I
    :cond_f2
    invoke-static {p2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfreemarker/cache/CacheStorage;

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setCacheStorage(Lfreemarker/cache/CacheStorage;)V

    goto/16 :goto_15

    .line 1031
    :cond_101
    const-string v8, "template_update_delay"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_112

    .line 1032
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setTemplateUpdateDelay(I)V

    goto/16 :goto_15

    .line 1033
    :cond_112
    const-string v8, "auto_include"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_123

    .line 1034
    invoke-virtual {p0, p2}, Lfreemarker/template/Configuration;->parseAsList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setAutoIncludes(Ljava/util/List;)V

    goto/16 :goto_15

    .line 1035
    :cond_123
    const-string v8, "auto_import"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_134

    .line 1036
    invoke-virtual {p0, p2}, Lfreemarker/template/Configuration;->parseAsImportList(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v8

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setAutoImports(Ljava/util/Map;)V

    goto/16 :goto_15

    .line 1037
    :cond_134
    const-string v8, "tag_syntax"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_16b

    .line 1038
    const-string v8, "auto_detect"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_14a

    .line 1039
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setTagSyntax(I)V

    goto/16 :goto_15

    .line 1040
    :cond_14a
    const-string v8, "angle_bracket"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_158

    .line 1041
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setTagSyntax(I)V

    goto/16 :goto_15

    .line 1042
    :cond_158
    const-string v8, "square_bracket"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_166

    .line 1043
    const/4 v8, 0x2

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setTagSyntax(I)V

    goto/16 :goto_15

    .line 1045
    :cond_166
    invoke-virtual {p0, p1, p2}, Lfreemarker/template/Configuration;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v8

    throw v8

    .line 1047
    :cond_16b
    const-string v8, "incompatible_improvements"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_17d

    .line 1048
    new-instance v8, Lfreemarker/template/Version;

    invoke-direct {v8, p2}, Lfreemarker/template/Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v8}, Lfreemarker/template/Configuration;->setIncompatibleImprovements(Lfreemarker/template/Version;)V

    goto/16 :goto_15

    .line 1049
    :cond_17d
    const-string v8, "incompatible_enhancements"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_18a

    .line 1050
    invoke-virtual {p0, p2}, Lfreemarker/template/Configuration;->setIncompatibleEnhancements(Ljava/lang/String;)V

    goto/16 :goto_15

    .line 1052
    :cond_18a
    invoke-super {p0, p1, p2}, Lfreemarker/core/Configurable;->setSetting(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_18d
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_18d} :catch_31

    goto/16 :goto_15
.end method

.method public setSharedVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "tm"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 830
    iget-object v0, p0, Lfreemarker/template/Configuration;->sharedVariables:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 831
    return-void
.end method

.method public setSharedVariable(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 851
    invoke-virtual {p0}, Lfreemarker/template/Configuration;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    invoke-interface {v0, p2}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lfreemarker/template/Configuration;->setSharedVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 852
    return-void
.end method

.method public setStrictSyntaxMode(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 515
    iput-boolean p1, p0, Lfreemarker/template/Configuration;->strictSyntax:Z

    .line 516
    return-void
.end method

.method public setTagSyntax(I)V
    .registers 4
    .param p1, "tagSyntax"    # I

    .prologue
    .line 636
    if-eqz p1, :cond_10

    const/4 v0, 0x2

    if-eq p1, v0, :cond_10

    const/4 v0, 0x1

    if-eq p1, v0, :cond_10

    .line 640
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\"tag_syntax\" can only be set to one of these: Configuration.AUTO_DETECT_TAG_SYNTAX, Configuration.ANGLE_BRACKET_SYNTAX, or Configuration.SQAUARE_BRACKET_SYNTAX"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 644
    :cond_10
    iput p1, p0, Lfreemarker/template/Configuration;->tagSyntax:I

    .line 645
    return-void
.end method

.method public declared-synchronized setTemplateLoader(Lfreemarker/cache/TemplateLoader;)V
    .registers 3
    .param p1, "loader"    # Lfreemarker/cache/TemplateLoader;

    .prologue
    .line 381
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    invoke-virtual {v0}, Lfreemarker/cache/TemplateCache;->getCacheStorage()Lfreemarker/cache/CacheStorage;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lfreemarker/template/Configuration;->createTemplateCache(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 382
    monitor-exit p0

    return-void

    .line 381
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setTemplateUpdateDelay(I)V
    .registers 7
    .param p1, "seconds"    # I

    .prologue
    .line 499
    iget-object v0, p0, Lfreemarker/template/Configuration;->cache:Lfreemarker/cache/TemplateCache;

    const-wide/16 v1, 0x3e8

    int-to-long v3, p1

    mul-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lfreemarker/cache/TemplateCache;->setDelay(J)V

    .line 500
    return-void
.end method

.method public setWhitespaceStripping(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 599
    iput-boolean p1, p0, Lfreemarker/template/Configuration;->whitespaceStripping:Z

    .line 600
    return-void
.end method
