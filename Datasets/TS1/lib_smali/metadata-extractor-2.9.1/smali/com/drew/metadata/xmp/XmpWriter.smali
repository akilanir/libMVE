.class public Lcom/drew/metadata/xmp/XmpWriter;
.super Ljava/lang/Object;
.source "XmpWriter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static write(Ljava/io/OutputStream;Lcom/drew/metadata/Metadata;)Z
    .registers 10
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "data"    # Lcom/drew/metadata/Metadata;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 21
    const-class v6, Lcom/drew/metadata/xmp/XmpDirectory;

    invoke-virtual {p1, v6}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/xmp/XmpDirectory;

    .line 22
    .local v0, "dir":Lcom/drew/metadata/xmp/XmpDirectory;
    if-nez v0, :cond_d

    .line 35
    :goto_c
    return v4

    .line 24
    :cond_d
    invoke-virtual {v0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v2

    .line 27
    .local v2, "meta":Lcom/adobe/xmp/XMPMeta;
    :try_start_11
    new-instance v6, Lcom/adobe/xmp/options/SerializeOptions;

    invoke-direct {v6}, Lcom/adobe/xmp/options/SerializeOptions;-><init>()V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/adobe/xmp/options/SerializeOptions;->setOmitPacketWrapper(Z)Lcom/adobe/xmp/options/SerializeOptions;

    move-result-object v3

    .line 28
    .local v3, "so":Lcom/adobe/xmp/options/SerializeOptions;
    invoke-static {v2, p0, v3}, Lcom/adobe/xmp/XMPMetaFactory;->serialize(Lcom/adobe/xmp/XMPMeta;Ljava/io/OutputStream;Lcom/adobe/xmp/options/SerializeOptions;)V
    :try_end_1e
    .catch Lcom/adobe/xmp/XMPException; {:try_start_11 .. :try_end_1e} :catch_20

    move v4, v5

    .line 35
    goto :goto_c

    .line 30
    .end local v3    # "so":Lcom/adobe/xmp/options/SerializeOptions;
    :catch_20
    move-exception v1

    .line 32
    .local v1, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v1}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_c
.end method
