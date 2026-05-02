.class public Lcom/drew/metadata/jfxx/JfxxDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "JfxxDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/jfxx/JfxxDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/jfxx/JfxxDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/jfxx/JfxxDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 45
    return-void
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 51
    packed-switch p1, :pswitch_data_e

    .line 55
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 53
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/jfxx/JfxxDescriptor;->getExtensionCodeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 51
    nop

    :pswitch_data_e
    .packed-switch 0x5
        :pswitch_8
    .end packed-switch
.end method

.method public getExtensionCodeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 62
    iget-object v1, p0, Lcom/drew/metadata/jfxx/JfxxDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/jfxx/JfxxDirectory;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Lcom/drew/metadata/jfxx/JfxxDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 63
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 64
    const/4 v1, 0x0

    .line 69
    :goto_c
    return-object v1

    .line 65
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_32

    .line 69
    :pswitch_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown extension code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 66
    :pswitch_28
    const-string v1, "Thumbnail coded using JPEG"

    goto :goto_c

    .line 67
    :pswitch_2b
    const-string v1, "Thumbnail stored using 1 byte/pixel"

    goto :goto_c

    .line 68
    :pswitch_2e
    const-string v1, "Thumbnail stored using 3 bytes/pixel"

    goto :goto_c

    .line 65
    nop

    :pswitch_data_32
    .packed-switch 0x10
        :pswitch_28
        :pswitch_2b
        :pswitch_14
        :pswitch_2e
    .end packed-switch
.end method
