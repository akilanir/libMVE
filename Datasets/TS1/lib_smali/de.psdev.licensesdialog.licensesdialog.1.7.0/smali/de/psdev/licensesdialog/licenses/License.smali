.class public abstract Lde/psdev/licensesdialog/licenses/License;
.super Ljava/lang/Object;
.source "License.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final LINE_SEPARATOR:Ljava/lang/String;

.field private static final serialVersionUID:J = 0x2b0697140585beebL


# instance fields
.field private mCachedFullText:Ljava/lang/String;

.field private mCachedSummaryText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lde/psdev/licensesdialog/licenses/License;->LINE_SEPARATOR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedSummaryText:Ljava/lang/String;

    .line 33
    iput-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedFullText:Ljava/lang/String;

    return-void
.end method

.method private toString(Ljava/io/BufferedReader;)Ljava/lang/String;
    .registers 6
    .param p1, "reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 88
    .local v1, "line":Ljava/lang/String;
    :goto_6
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_16

    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lde/psdev/licensesdialog/licenses/License;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 91
    :cond_16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method protected getContent(Landroid/content/Context;I)Ljava/lang/String;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "contentResourceId"    # I

    .prologue
    .line 64
    const/4 v2, 0x0

    .line 66
    .local v2, "reader":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 67
    .local v1, "inputStream":Ljava/io/InputStream;
    if-eqz v1, :cond_1f

    .line 68
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_15} :catch_27
    .catchall {:try_start_1 .. :try_end_15} :catchall_2e

    .line 69
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .local v3, "reader":Ljava/io/BufferedReader;
    :try_start_15
    invoke-direct {p0, v3}, Lde/psdev/licensesdialog/licenses/License;->toString(Ljava/io/BufferedReader;)Ljava/lang/String;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_3c
    .catchall {:try_start_15 .. :try_end_18} :catchall_39

    move-result-object v4

    .line 75
    if-eqz v3, :cond_1e

    .line 77
    :try_start_1b
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1e} :catch_35

    .line 80
    :cond_1e
    :goto_1e
    return-object v4

    .line 71
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    :cond_1f
    :try_start_1f
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Error opening license file."

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_27} :catch_27
    .catchall {:try_start_1f .. :try_end_27} :catchall_2e

    .line 72
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_27
    move-exception v0

    .line 73
    .local v0, "e":Ljava/io/IOException;
    :goto_28
    :try_start_28
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_2e
    .catchall {:try_start_28 .. :try_end_2e} :catchall_2e

    .line 75
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_2e
    move-exception v4

    :goto_2f
    if-eqz v2, :cond_34

    .line 77
    :try_start_31
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_34} :catch_37

    .line 80
    :cond_34
    :goto_34
    throw v4

    .line 78
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v1    # "inputStream":Ljava/io/InputStream;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catch_35
    move-exception v5

    goto :goto_1e

    .end local v1    # "inputStream":Ljava/io/InputStream;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    :catch_37
    move-exception v5

    goto :goto_34

    .line 75
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v1    # "inputStream":Ljava/io/InputStream;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catchall_39
    move-exception v4

    move-object v2, v3

    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    goto :goto_2f

    .line 72
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catch_3c
    move-exception v0

    move-object v2, v3

    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    goto :goto_28
.end method

.method public final getFullText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    iget-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedFullText:Ljava/lang/String;

    if-nez v0, :cond_a

    .line 57
    invoke-virtual {p0, p1}, Lde/psdev/licensesdialog/licenses/License;->readFullTextFromResources(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedFullText:Ljava/lang/String;

    .line 60
    :cond_a
    iget-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedFullText:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public final getSummaryText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    iget-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedSummaryText:Ljava/lang/String;

    if-nez v0, :cond_a

    .line 49
    invoke-virtual {p0, p1}, Lde/psdev/licensesdialog/licenses/License;->readSummaryTextFromResources(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedSummaryText:Ljava/lang/String;

    .line 52
    :cond_a
    iget-object v0, p0, Lde/psdev/licensesdialog/licenses/License;->mCachedSummaryText:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract getVersion()Ljava/lang/String;
.end method

.method public abstract readFullTextFromResources(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract readSummaryTextFromResources(Landroid/content/Context;)Ljava/lang/String;
.end method
