.class public Lfreemarker/cache/FileTemplateLoader;
.super Ljava/lang/Object;
.source "FileTemplateLoader.java"

# interfaces
.implements Lfreemarker/cache/TemplateLoader;


# static fields
.field private static final SEP_IS_SLASH:Z


# instance fields
.field public final baseDir:Ljava/io/File;

.field private final canonicalPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 78
    sget-char v0, Ljava/io/File;->separatorChar:C

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_7
    sput-boolean v0, Lfreemarker/cache/FileTemplateLoader;->SEP_IS_SLASH:Z

    return-void

    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Ljava/io/File;

    const-string v1, "user.dir"

    invoke-static {v1}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lfreemarker/cache/FileTemplateLoader;-><init>(Ljava/io/File;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "baseDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/cache/FileTemplateLoader;-><init>(Ljava/io/File;Z)V

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 7
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "allowLinking"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    :try_start_3
    new-instance v3, Lfreemarker/cache/FileTemplateLoader$1;

    invoke-direct {v3, p0, p1, p2}, Lfreemarker/cache/FileTemplateLoader$1;-><init>(Lfreemarker/cache/FileTemplateLoader;Ljava/io/File;Z)V

    invoke-static {v3}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Ljava/lang/Object;

    move-object v2, v0

    .line 147
    .local v2, "retval":[Ljava/lang/Object;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    check-cast v3, Ljava/io/File;

    iput-object v3, p0, Lfreemarker/cache/FileTemplateLoader;->baseDir:Ljava/io/File;

    .line 148
    const/4 v3, 0x1

    aget-object v3, v2, v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lfreemarker/cache/FileTemplateLoader;->canonicalPath:Ljava/lang/String;
    :try_end_20
    .catch Ljava/security/PrivilegedActionException; {:try_start_3 .. :try_end_20} :catch_21

    .line 154
    return-void

    .line 150
    .end local v2    # "retval":[Ljava/lang/Object;
    :catch_21
    move-exception v1

    .line 152
    .local v1, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v1}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v3

    check-cast v3, Ljava/io/IOException;

    throw v3
.end method

.method static access$000()Z
    .registers 1

    .prologue
    .line 76
    sget-boolean v0, Lfreemarker/cache/FileTemplateLoader;->SEP_IS_SLASH:Z

    return v0
.end method

.method static access$100(Lfreemarker/cache/FileTemplateLoader;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/cache/FileTemplateLoader;

    .prologue
    .line 76
    iget-object v0, p0, Lfreemarker/cache/FileTemplateLoader;->canonicalPath:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public closeTemplateSource(Ljava/lang/Object;)V
    .registers 2
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 233
    return-void
.end method

.method public findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    :try_start_0
    new-instance v1, Lfreemarker/cache/FileTemplateLoader$2;

    invoke-direct {v1, p0, p1}, Lfreemarker/cache/FileTemplateLoader$2;-><init>(Lfreemarker/cache/FileTemplateLoader;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    return-object v1

    .line 183
    :catch_a
    move-exception v0

    .line 185
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v1

    check-cast v1, Ljava/io/IOException;

    throw v1
.end method

.method public getLastModified(Ljava/lang/Object;)J
    .registers 4
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 191
    new-instance v0, Lfreemarker/cache/FileTemplateLoader$3;

    invoke-direct {v0, p0, p1}, Lfreemarker/cache/FileTemplateLoader$3;-><init>(Lfreemarker/cache/FileTemplateLoader;Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;
    .registers 5
    .param p1, "templateSource"    # Ljava/lang/Object;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    :try_start_0
    new-instance v1, Lfreemarker/cache/FileTemplateLoader$4;

    invoke-direct {v1, p0, p1, p2}, Lfreemarker/cache/FileTemplateLoader$4;-><init>(Lfreemarker/cache/FileTemplateLoader;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/Reader;
    :try_end_b
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_b} :catch_c

    return-object v1

    .line 224
    :catch_c
    move-exception v0

    .line 226
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v1

    check-cast v1, Ljava/io/IOException;

    throw v1
.end method
