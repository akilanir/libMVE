.class Lezvcard/io/scribe/AgentScribe$Injector;
.super Ljava/lang/Object;
.source "AgentScribe.java"

# interfaces
.implements Lezvcard/io/EmbeddedVCardException$InjectionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/scribe/AgentScribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Injector"
.end annotation


# instance fields
.field private final property:Lezvcard/property/Agent;


# direct methods
.method public constructor <init>(Lezvcard/property/Agent;)V
    .registers 2
    .param p1, "property"    # Lezvcard/property/Agent;

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-object p1, p0, Lezvcard/io/scribe/AgentScribe$Injector;->property:Lezvcard/property/Agent;

    .line 115
    return-void
.end method


# virtual methods
.method public getProperty()Lezvcard/property/VCardProperty;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lezvcard/io/scribe/AgentScribe$Injector;->property:Lezvcard/property/Agent;

    return-object v0
.end method

.method public injectVCard(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 118
    iget-object v0, p0, Lezvcard/io/scribe/AgentScribe$Injector;->property:Lezvcard/property/Agent;

    invoke-virtual {v0, p1}, Lezvcard/property/Agent;->setVCard(Lezvcard/VCard;)V

    .line 119
    return-void
.end method
