.class final Lorg/unbescape/xml/XmlEscapeSymbols$References;
.super Ljava/lang/Object;
.source "XmlEscapeSymbols.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/xml/XmlEscapeSymbols;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "References"
.end annotation


# instance fields
.field private final references:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/unbescape/xml/XmlEscapeSymbols$Reference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 378
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 375
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/unbescape/xml/XmlEscapeSymbols$References;->references:Ljava/util/List;

    .line 379
    return-void
.end method

.method static synthetic access$000(Lorg/unbescape/xml/XmlEscapeSymbols$References;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/unbescape/xml/XmlEscapeSymbols$References;

    .prologue
    .line 373
    iget-object v0, p0, Lorg/unbescape/xml/XmlEscapeSymbols$References;->references:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method addReference(ILjava/lang/String;)V
    .registers 6
    .param p1, "codepoint"    # I
    .param p2, "cer"    # Ljava/lang/String;

    .prologue
    .line 382
    iget-object v0, p0, Lorg/unbescape/xml/XmlEscapeSymbols$References;->references:Ljava/util/List;

    new-instance v1, Lorg/unbescape/xml/XmlEscapeSymbols$Reference;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p1, v2}, Lorg/unbescape/xml/XmlEscapeSymbols$Reference;-><init>(Ljava/lang/String;ILorg/unbescape/xml/XmlEscapeSymbols$1;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    return-void
.end method
