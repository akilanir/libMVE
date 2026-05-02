.class public Lch/qos/logback/classic/util/ContextInitializer;
.super Ljava/lang/Object;


# static fields
.field private static final ASSETS_DIR:Ljava/lang/String;

.field public static final AUTOCONFIG_FILE:Ljava/lang/String; = "logback.xml"

.field public static final CONFIG_FILE_PROPERTY:Ljava/lang/String; = "logback.configurationFile"

.field public static final STATUS_LISTENER_CLASS:Ljava/lang/String; = "logback.statusListenerClass"


# instance fields
.field final classLoader:Ljava/lang/ClassLoader;

.field final loggerContext:Lch/qos/logback/classic/LoggerContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Lch/qos/logback/core/android/CommonPathUtil;->getAssetsDirectoryPath()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/util/ContextInitializer;->ASSETS_DIR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/classic/LoggerContext;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/util/ContextInitializer;->loggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-static {p0}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfObject(Ljava/lang/Object;)Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    return-void
.end method

.method private findConfigFileFromSystemProperties(Z)Ljava/net/URL;
    .registers 6

    const/4 v1, 0x0

    const-string v0, "logback.configurationFile"

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_61

    :try_start_9
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_37

    if-eqz p1, :cond_21

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {p0, v2, v3, v2}, Lch/qos/logback/classic/util/ContextInitializer;->statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V

    :cond_21
    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;
    :try_end_28
    .catch Ljava/net/MalformedURLException; {:try_start_9 .. :try_end_28} :catch_3d
    .catchall {:try_start_9 .. :try_end_28} :catchall_65

    move-result-object v0

    :goto_29
    if-eqz p1, :cond_36

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_33
    invoke-direct {p0, v2, v3, v1}, Lch/qos/logback/classic/util/ContextInitializer;->statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V

    :cond_36
    :goto_36
    return-object v0

    :cond_37
    :try_start_37
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3c
    .catch Ljava/net/MalformedURLException; {:try_start_37 .. :try_end_3c} :catch_3d
    .catchall {:try_start_37 .. :try_end_3c} :catchall_65

    goto :goto_29

    :catch_3d
    move-exception v0

    :try_start_3e
    iget-object v0, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    invoke-static {v2, v0}, Lch/qos/logback/core/util/Loader;->getResource(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/net/URL;
    :try_end_43
    .catchall {:try_start_3e .. :try_end_43} :catchall_65

    move-result-object v0

    if-eqz v0, :cond_54

    if-eqz p1, :cond_36

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_50

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_50
    invoke-direct {p0, v2, v3, v1}, Lch/qos/logback/classic/util/ContextInitializer;->statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V

    goto :goto_36

    :cond_54
    if-eqz p1, :cond_61

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_63

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_5e
    invoke-direct {p0, v2, v3, v0}, Lch/qos/logback/classic/util/ContextInitializer;->statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V

    :cond_61
    move-object v0, v1

    goto :goto_36

    :cond_63
    move-object v0, v1

    goto :goto_5e

    :catchall_65
    move-exception v0

    if-eqz p1, :cond_73

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_70

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_70
    invoke-direct {p0, v2, v3, v1}, Lch/qos/logback/classic/util/ContextInitializer;->statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V

    :cond_73
    throw v0
.end method

.method private findConfigFileURLFromAssets(Z)Ljava/io/InputStream;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lch/qos/logback/classic/util/ContextInitializer;->ASSETS_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "logback.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/util/ContextInitializer;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {p0, v0, v1, p1}, Lch/qos/logback/classic/util/ContextInitializer;->getResource(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method private getResource(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/io/InputStream;
    .registers 6

    invoke-virtual {p2, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz p3, :cond_d

    const/4 v0, 0x0

    if-eqz v1, :cond_a

    move-object v0, p1

    :cond_a
    invoke-direct {p0, p1, p2, v0}, Lch/qos/logback/classic/util/ContextInitializer;->statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V

    :cond_d
    return-object v1
.end method

.method private statusOnResourceSearch(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .registers 8

    iget-object v0, p0, Lch/qos/logback/classic/util/ContextInitializer;->loggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-virtual {v0}, Lch/qos/logback/classic/LoggerContext;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-nez p3, :cond_2c

    new-instance v1, Lch/qos/logback/core/status/InfoStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could NOT find resource ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->loggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-direct {v1, v2, v3}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    :goto_2b
    return-void

    :cond_2c
    new-instance v1, Lch/qos/logback/core/status/InfoStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Found resource ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] at ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->loggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-direct {v1, v2, v3}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    goto :goto_2b
.end method


# virtual methods
.method public autoConfig()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    const/4 v1, 0x1

    iget-object v0, p0, Lch/qos/logback/classic/util/ContextInitializer;->loggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-static {v0}, Lch/qos/logback/classic/util/StatusListenerConfigHelper;->installIfAsked(Lch/qos/logback/classic/LoggerContext;)V

    const/4 v0, 0x0

    new-instance v2, Lch/qos/logback/classic/joran/JoranConfigurator;

    invoke-direct {v2}, Lch/qos/logback/classic/joran/JoranConfigurator;-><init>()V

    iget-object v3, p0, Lch/qos/logback/classic/util/ContextInitializer;->loggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/joran/JoranConfigurator;->setContext(Lch/qos/logback/core/Context;)V

    invoke-direct {p0, v1}, Lch/qos/logback/classic/util/ContextInitializer;->findConfigFileFromSystemProperties(Z)Ljava/net/URL;

    move-result-object v3

    if-eqz v3, :cond_1b

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/joran/JoranConfigurator;->doConfigure(Ljava/net/URL;)V

    move v0, v1

    :cond_1b
    if-nez v0, :cond_26

    invoke-direct {p0, v1}, Lch/qos/logback/classic/util/ContextInitializer;->findConfigFileURLFromAssets(Z)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_26

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/joran/JoranConfigurator;->doConfigure(Ljava/io/InputStream;)V

    :cond_26
    return-void
.end method
