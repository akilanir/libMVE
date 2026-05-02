.class public Lch/qos/logback/core/util/LocationUtil;
.super Ljava/lang/Object;


# static fields
.field public static final CLASSPATH_SCHEME:Ljava/lang/String; = "classpath:"

.field public static final SCHEME_PATTERN:Ljava/lang/String; = "^\\p{Alpha}[\\p{Alnum}+.-]*:.*$"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static urlForResource(Ljava/lang/String;)Ljava/net/URL;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "location is required"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    const-string v0, "^\\p{Alpha}[\\p{Alnum}+.-]*:.*$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-static {p0}, Lch/qos/logback/core/util/Loader;->getResourceBySelfClassLoader(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    :goto_16
    if-nez v0, :cond_56

    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0, p0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1e
    const-string v0, "classpath:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_50

    const-string v0, "classpath:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3d

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_3d
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_4b

    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "path is required"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4b
    invoke-static {v0}, Lch/qos/logback/core/util/Loader;->getResourceBySelfClassLoader(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    goto :goto_16

    :cond_50
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    goto :goto_16

    :cond_56
    return-object v0
.end method
