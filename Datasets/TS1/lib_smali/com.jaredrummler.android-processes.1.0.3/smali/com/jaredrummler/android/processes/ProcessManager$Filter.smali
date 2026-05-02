.class public Lcom/jaredrummler/android/processes/ProcessManager$Filter;
.super Ljava/lang/Object;
.source "ProcessManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jaredrummler/android/processes/ProcessManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Filter"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private apps:Z

.field private name:Ljava/lang/String;

.field private pid:I

.field private ppid:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    iput v0, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->pid:I

    .line 214
    iput v0, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->ppid:I

    return-void
.end method


# virtual methods
.method public run()Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/jaredrummler/android/processes/models/AndroidProcess;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v10, -0x1

    .line 266
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 267
    .local v5, "processes":Ljava/util/List;, "Ljava/util/List<Lcom/jaredrummler/android/processes/models/AndroidProcess;>;"
    new-instance v6, Ljava/io/File;

    const-string v7, "/proc"

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 268
    .local v2, "files":[Ljava/io/File;
    array-length v7, v2

    const/4 v6, 0x0

    :goto_13
    if-ge v6, v7, :cond_65

    aget-object v1, v2, v6

    .line 269
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_2d

    .line 272
    :try_start_1d
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_24
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_24} :catch_30

    move-result v3

    .line 276
    .local v3, "pid":I
    iget v8, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->pid:I

    if-eq v8, v10, :cond_32

    iget v8, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->pid:I

    if-eq v3, v8, :cond_32

    .line 268
    .end local v3    # "pid":I
    :cond_2d
    :goto_2d
    add-int/lit8 v6, v6, 0x1

    goto :goto_13

    .line 273
    :catch_30
    move-exception v0

    .line 274
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_2d

    .line 281
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v3    # "pid":I
    :cond_32
    :try_start_32
    iget-boolean v8, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->apps:Z

    if-eqz v8, :cond_5f

    .line 282
    new-instance v4, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;

    invoke-direct {v4, v3}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;-><init>(I)V

    .line 286
    .local v4, "process":Lcom/jaredrummler/android/processes/models/AndroidProcess;
    :goto_3b
    iget-object v8, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->name:Ljava/lang/String;

    if-eqz v8, :cond_49

    iget-object v8, v4, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    iget-object v9, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2d

    .line 289
    :cond_49
    iget v8, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->ppid:I

    if-eq v8, v10, :cond_59

    invoke-virtual {v4}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->stat()Lcom/jaredrummler/android/processes/models/Stat;

    move-result-object v8

    invoke-virtual {v8}, Lcom/jaredrummler/android/processes/models/Stat;->ppid()I

    move-result v8

    iget v9, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->ppid:I

    if-ne v8, v9, :cond_2d

    .line 292
    :cond_59
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    .line 293
    .end local v4    # "process":Lcom/jaredrummler/android/processes/models/AndroidProcess;
    :catch_5d
    move-exception v8

    goto :goto_2d

    .line 284
    :cond_5f
    new-instance v4, Lcom/jaredrummler/android/processes/models/AndroidProcess;

    invoke-direct {v4, v3}, Lcom/jaredrummler/android/processes/models/AndroidProcess;-><init>(I)V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_64} :catch_5d
    .catch Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException; {:try_start_32 .. :try_end_64} :catch_66

    .restart local v4    # "process":Lcom/jaredrummler/android/processes/models/AndroidProcess;
    goto :goto_3b

    .line 302
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "pid":I
    .end local v4    # "process":Lcom/jaredrummler/android/processes/models/AndroidProcess;
    :cond_65
    return-object v5

    .line 298
    .restart local v1    # "file":Ljava/io/File;
    .restart local v3    # "pid":I
    :catch_66
    move-exception v8

    goto :goto_2d
.end method

.method public setApps(Z)Lcom/jaredrummler/android/processes/ProcessManager$Filter;
    .registers 2
    .param p1, "apps"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 257
    iput-boolean p1, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->apps:Z

    .line 258
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/jaredrummler/android/processes/ProcessManager$Filter;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 224
    iput-object p1, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->name:Ljava/lang/String;

    .line 225
    return-object p0
.end method

.method public setPid(I)Lcom/jaredrummler/android/processes/ProcessManager$Filter;
    .registers 2
    .param p1, "pid"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 235
    iput p1, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->pid:I

    .line 236
    return-object p0
.end method

.method public setPpid(I)Lcom/jaredrummler/android/processes/ProcessManager$Filter;
    .registers 2
    .param p1, "ppid"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 246
    iput p1, p0, Lcom/jaredrummler/android/processes/ProcessManager$Filter;->ppid:I

    .line 247
    return-object p0
.end method
