.class public Lroboguice/util/temp/Ln$BaseConfig;
.super Ljava/lang/Object;
.source "Ln.java"

# interfaces
.implements Lroboguice/util/temp/Ln$Config;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lroboguice/util/temp/Ln;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BaseConfig"
.end annotation


# instance fields
.field protected minimumLogLevel:I

.field protected packageName:Ljava/lang/String;

.field protected scope:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    const/4 v0, 0x2

    iput v0, p0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    .line 194
    const-string v0, ""

    iput-object v0, p0, Lroboguice/util/temp/Ln$BaseConfig;->packageName:Ljava/lang/String;

    .line 195
    const-string v0, ""

    iput-object v0, p0, Lroboguice/util/temp/Ln$BaseConfig;->scope:Ljava/lang/String;

    .line 198
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;)V
    .registers 8
    .param p1, "context"    # Landroid/app/Application;

    .prologue
    const/4 v2, 0x2

    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    iput v2, p0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    .line 194
    const-string v3, ""

    iput-object v3, p0, Lroboguice/util/temp/Ln$BaseConfig;->packageName:Ljava/lang/String;

    .line 195
    const-string v3, ""

    iput-object v3, p0, Lroboguice/util/temp/Ln$BaseConfig;->scope:Ljava/lang/String;

    .line 202
    :try_start_e
    invoke-virtual {p1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lroboguice/util/temp/Ln$BaseConfig;->packageName:Ljava/lang/String;

    .line 203
    invoke-virtual {p1}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    iget-object v4, p0, Lroboguice/util/temp/Ln$BaseConfig;->packageName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v1, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 204
    .local v1, "flags":I
    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_41

    :goto_25
    iput v2, p0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    .line 205
    iget-object v2, p0, Lroboguice/util/temp/Ln$BaseConfig;->packageName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lroboguice/util/temp/Ln$BaseConfig;->scope:Ljava/lang/String;

    .line 206
    const-string v2, "Configuring Logging, minimum log level is %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    invoke-static {v5}, Lroboguice/util/temp/Ln;->logLevelToString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_40} :catch_43

    .line 210
    .end local v1    # "flags":I
    :goto_40
    return-void

    .line 204
    .restart local v1    # "flags":I
    :cond_41
    const/4 v2, 0x4

    goto :goto_25

    .line 207
    .end local v1    # "flags":I
    :catch_43
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lroboguice/util/temp/Ln$BaseConfig;->packageName:Ljava/lang/String;

    const-string v3, "Error configuring logger"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_40
.end method


# virtual methods
.method public getLoggingLevel()I
    .registers 2

    .prologue
    .line 214
    iget v0, p0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    return v0
.end method

.method public setLoggingLevel(I)V
    .registers 2
    .param p1, "level"    # I

    .prologue
    .line 219
    iput p1, p0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    .line 220
    return-void
.end method
