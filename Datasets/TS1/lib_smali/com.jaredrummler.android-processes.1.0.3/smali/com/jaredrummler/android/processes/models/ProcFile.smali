.class public Lcom/jaredrummler/android/processes/models/ProcFile;
.super Ljava/io/File;
.source "ProcFile.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/jaredrummler/android/processes/models/ProcFile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final content:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 81
    new-instance v0, Lcom/jaredrummler/android/processes/models/ProcFile$1;

    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/ProcFile$1;-><init>()V

    sput-object v0, Lcom/jaredrummler/android/processes/models/ProcFile;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jaredrummler/android/processes/models/ProcFile;->content:Ljava/lang/String;

    .line 66
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-static {p1}, Lcom/jaredrummler/android/processes/models/ProcFile;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jaredrummler/android/processes/models/ProcFile;->content:Ljava/lang/String;

    .line 61
    return-void
.end method

.method protected static readFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    const/4 v3, 0x0

    .line 42
    .local v3, "reader":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .local v2, "output":Ljava/lang/StringBuilder;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_30

    .line 44
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .local v4, "reader":Ljava/io/BufferedReader;
    :try_start_10
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    const-string v1, ""

    .local v1, "newLine":Ljava/lang/String;
    :goto_16
    if-eqz v0, :cond_26

    .line 45
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    const-string v1, "\n"

    .line 44
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 48
    :cond_26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_29
    .catchall {:try_start_10 .. :try_end_29} :catchall_37

    move-result-object v5

    .line 50
    if-eqz v4, :cond_2f

    .line 51
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    :cond_2f
    return-object v5

    .line 50
    .end local v0    # "line":Ljava/lang/String;
    .end local v1    # "newLine":Ljava/lang/String;
    .end local v2    # "output":Ljava/lang/StringBuilder;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catchall_30
    move-exception v5

    :goto_31
    if-eqz v3, :cond_36

    .line 51
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    :cond_36
    throw v5

    .line 50
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "output":Ljava/lang/StringBuilder;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :catchall_37
    move-exception v5

    move-object v3, v4

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_31
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public length()J
    .registers 3

    .prologue
    .line 69
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/ProcFile;->content:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/ProcFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 78
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/ProcFile;->content:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 79
    return-void
.end method
