.class public Lcom/drew/lang/KeyValuePair;
.super Ljava/lang/Object;
.source "KeyValuePair.java"


# instance fields
.field private final _key:Ljava/lang/String;

.field private final _value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/drew/lang/KeyValuePair;->_key:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/drew/lang/KeyValuePair;->_value:Ljava/lang/String;

    .line 39
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/drew/lang/KeyValuePair;->_key:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lcom/drew/lang/KeyValuePair;->_value:Ljava/lang/String;

    return-object v0
.end method
