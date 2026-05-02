.class Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;
.super Ljava/lang/Object;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NTLMMessage"
.end annotation


# instance fields
.field private currentOutputPosition:I

.field private messageContents:[B


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 841
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 835
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 838
    const/4 v0, 0x0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 842
    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .registers 8
    .param p1, "messageBody"    # Ljava/lang/String;
    .param p2, "expectedType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 845
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 835
    const/4 v2, 0x0

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 838
    const/4 v2, 0x0

    iput v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 846
    const-string v2, "ASCII"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v2, v3}, Lcz/msebera/android/httpclient/extras/Base64;->decode([BI)[B

    move-result-object v2

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 849
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v2, v2

    # getter for: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v3

    array-length v3, v3

    if-ge v2, v3, :cond_28

    .line 850
    new-instance v2, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;

    const-string v3, "NTLM message decoding error - packet too short"

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 852
    :cond_28
    const/4 v0, 0x0

    .line 853
    .local v0, "i":I
    :goto_29
    # getter for: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_47

    .line 854
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    aget-byte v2, v2, v0

    # getter for: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v3

    aget-byte v3, v3, v0

    if-eq v2, v3, :cond_44

    .line 855
    new-instance v2, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;

    const-string v3, "NTLM message expected - instead got unrecognized bytes"

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 858
    :cond_44
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 862
    :cond_47
    # getter for: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->readULong(I)I

    move-result v1

    .line 863
    .local v1, "type":I
    if-eq v1, p2, :cond_7d

    .line 864
    new-instance v2, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NTLM type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " message expected - instead got type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 865
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 868
    :cond_7d
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v2, v2

    iput v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 869
    return-void
.end method


# virtual methods
.method protected addByte(B)V
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 937
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    aput-byte p1, v0, v1

    .line 938
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 939
    return-void
.end method

.method protected addBytes([B)V
    .registers 7
    .param p1, "bytes"    # [B

    .prologue
    .line 948
    if-nez p1, :cond_3

    .line 955
    :cond_2
    return-void

    .line 951
    :cond_3
    array-length v2, p1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v2, :cond_2

    aget-byte v0, p1, v1

    .line 952
    .local v0, "b":B
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    iget v4, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    aput-byte v0, v3, v4

    .line 953
    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 951
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method protected addULong(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 965
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 966
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 967
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 968
    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 969
    return-void
.end method

.method protected addUShort(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 959
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 960
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 961
    return-void
.end method

.method protected getMessageLength()I
    .registers 2

    .prologue
    .line 881
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    return v0
.end method

.method protected getPreambleLength()I
    .registers 2

    .prologue
    .line 876
    # getter for: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method getResponse()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 979
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v2, v2

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    if-le v2, v3, :cond_1e

    .line 980
    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    new-array v1, v2, [B

    .line 981
    .local v1, "tmp":[B
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 982
    move-object v0, v1

    .line 986
    .end local v1    # "tmp":[B
    .local v0, "resp":[B
    :goto_14
    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/extras/Base64;->encode([BI)[B

    move-result-object v2

    invoke-static {v2}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getAsciiString([B)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 984
    .end local v0    # "resp":[B
    :cond_1e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .restart local v0    # "resp":[B
    goto :goto_14
.end method

.method protected prepareResponse(II)V
    .registers 4
    .param p1, "maxlength"    # I
    .param p2, "messageType"    # I

    .prologue
    .line 924
    new-array v0, p1, [B

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 925
    const/4 v0, 0x0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 926
    # getter for: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addBytes([B)V

    .line 927
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->addULong(I)V

    .line 928
    return-void
.end method

.method protected readByte(I)B
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 886
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v0, v0

    add-int/lit8 v1, p1, 0x1

    if-ge v0, v1, :cond_f

    .line 887
    new-instance v0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;

    const-string v1, "NTLM: Message too short"

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 889
    :cond_f
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method protected readBytes([BI)V
    .registers 6
    .param p1, "buffer"    # [B
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 894
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v0, v0

    array-length v1, p1

    add-int/2addr v1, p2

    if-ge v0, v1, :cond_f

    .line 895
    new-instance v0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;

    const-string v1, "NTLM: Message too short"

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 897
    :cond_f
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    const/4 v1, 0x0

    array-length v2, p1

    invoke-static {v0, p2, p1, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 898
    return-void
.end method

.method protected readSecurityBuffer(I)[B
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 912
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    # invokes: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->readSecurityBuffer([BI)[B
    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1300([BI)[B

    move-result-object v0

    return-object v0
.end method

.method protected readULong(I)I
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 907
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    # invokes: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->readULong([BI)I
    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1200([BI)I

    move-result v0

    return v0
.end method

.method protected readUShort(I)I
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 902
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    # invokes: Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->readUShort([BI)I
    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->access$1100([BI)I

    move-result v0

    return v0
.end method
