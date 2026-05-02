.class public Lcom/bea/xml/stream/util/EmptyIterator;
.super Ljava/lang/Object;
.source "EmptyIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# static fields
.field public static final emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    new-instance v0, Lcom/bea/xml/stream/util/EmptyIterator;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/EmptyIterator;-><init>()V

    sput-object v0, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 20
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 21
    const/4 v0, 0x0

    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 23
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
