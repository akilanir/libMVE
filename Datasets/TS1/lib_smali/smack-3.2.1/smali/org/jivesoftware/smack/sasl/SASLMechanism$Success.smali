.class public Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "SASLMechanism.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/sasl/SASLMechanism;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Success"
.end annotation


# instance fields
.field private final data:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 280
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 281
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;->data:Ljava/lang/String;

    .line 282
    return-void
.end method


# virtual methods
.method public toXML()Ljava/lang/String;
    .registers 3

    .prologue
    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .local v0, "stanza":Ljava/lang/StringBuilder;
    const-string v1, "<success xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    iget-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;->data:Ljava/lang/String;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;->data:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1f

    .line 289
    iget-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;->data:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    :cond_1f
    const-string v1, "</success>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
