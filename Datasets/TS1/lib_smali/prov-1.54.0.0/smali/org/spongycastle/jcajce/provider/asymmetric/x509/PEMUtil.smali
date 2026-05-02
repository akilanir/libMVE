.class Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;
.super Ljava/lang/Object;
.source "PEMUtil.java"


# instance fields
.field private final _footer1:Ljava/lang/String;

.field private final _footer2:Ljava/lang/String;

.field private final _header1:Ljava/lang/String;

.field private final _header2:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-----BEGIN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-----"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_header1:Ljava/lang/String;

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-----BEGIN X509 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-----"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_header2:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-----END "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-----"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_footer1:Ljava/lang/String;

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-----END X509 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-----"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_footer2:Ljava/lang/String;

    .line 23
    return-void
.end method

.method private readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 34
    .local v1, "l":Ljava/lang/StringBuffer;
    :cond_5
    :goto_5
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "c":I
    const/16 v2, 0xd

    if-eq v0, v2, :cond_18

    const/16 v2, 0xa

    if-eq v0, v2, :cond_18

    if-ltz v0, :cond_18

    .line 36
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 39
    :cond_18
    if-ltz v0, :cond_20

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-eqz v2, :cond_5

    .line 41
    :cond_20
    if-gez v0, :cond_24

    .line 43
    const/4 v2, 0x0

    .line 46
    :goto_23
    return-object v2

    :cond_24
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_23
.end method


# virtual methods
.method readPEMObject(Ljava/io/InputStream;)Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 56
    .local v2, "pemBuf":Ljava/lang/StringBuffer;
    :cond_5
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_1b

    .line 58
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_header1:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1b

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_header2:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 64
    :cond_1b
    :goto_1b
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_31

    .line 66
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_footer1:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_31

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PEMUtil;->_footer2:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_44

    .line 74
    :cond_31
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-eqz v3, :cond_51

    .line 78
    :try_start_37
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/util/encoders/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_42} :catch_48

    move-result-object v3

    .line 86
    :goto_43
    return-object v3

    .line 71
    :cond_44
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1b

    .line 80
    :catch_48
    move-exception v0

    .line 82
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "malformed PEM data encountered"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 86
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_51
    const/4 v3, 0x0

    goto :goto_43
.end method
