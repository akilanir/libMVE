.class public Lezvcard/io/EmbeddedVCardException;
.super Ljava/lang/RuntimeException;
.source "EmbeddedVCardException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/EmbeddedVCardException$InjectionCallback;
    }
.end annotation


# instance fields
.field private final callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

.field private final vcard:Lezvcard/VCard;


# direct methods
.method public constructor <init>(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/io/EmbeddedVCardException;->callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    .line 61
    iput-object p1, p0, Lezvcard/io/EmbeddedVCardException;->vcard:Lezvcard/VCard;

    .line 62
    return-void
.end method

.method public constructor <init>(Lezvcard/io/EmbeddedVCardException$InjectionCallback;)V
    .registers 3
    .param p1, "callback"    # Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 51
    iput-object p1, p0, Lezvcard/io/EmbeddedVCardException;->callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/io/EmbeddedVCardException;->vcard:Lezvcard/VCard;

    .line 53
    return-void
.end method


# virtual methods
.method public getProperty()Lezvcard/property/VCardProperty;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lezvcard/io/EmbeddedVCardException;->callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    if-nez v0, :cond_6

    .line 91
    const/4 v0, 0x0

    .line 94
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/io/EmbeddedVCardException;->callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    invoke-interface {v0}, Lezvcard/io/EmbeddedVCardException$InjectionCallback;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v0

    goto :goto_5
.end method

.method public getVCard()Lezvcard/VCard;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lezvcard/io/EmbeddedVCardException;->vcard:Lezvcard/VCard;

    return-object v0
.end method

.method public injectVCard(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 78
    iget-object v0, p0, Lezvcard/io/EmbeddedVCardException;->callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    if-nez v0, :cond_5

    .line 83
    :goto_4
    return-void

    .line 82
    :cond_5
    iget-object v0, p0, Lezvcard/io/EmbeddedVCardException;->callback:Lezvcard/io/EmbeddedVCardException$InjectionCallback;

    invoke-interface {v0, p1}, Lezvcard/io/EmbeddedVCardException$InjectionCallback;->injectVCard(Lezvcard/VCard;)V

    goto :goto_4
.end method
