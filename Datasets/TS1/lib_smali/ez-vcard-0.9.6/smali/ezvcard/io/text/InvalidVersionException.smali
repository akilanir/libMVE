.class public Lezvcard/io/text/InvalidVersionException;
.super Lezvcard/io/text/VCardParseException;
.source "InvalidVersionException.java"


# instance fields
.field private final version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "version"    # Ljava/lang/String;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0, p2}, Lezvcard/io/text/VCardParseException;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object p1, p0, Lezvcard/io/text/InvalidVersionException;->version:Ljava/lang/String;

    .line 47
    return-void
.end method


# virtual methods
.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lezvcard/io/text/InvalidVersionException;->version:Ljava/lang/String;

    return-object v0
.end method
