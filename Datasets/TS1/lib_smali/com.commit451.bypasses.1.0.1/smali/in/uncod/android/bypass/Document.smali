.class public Lin/uncod/android/bypass/Document;
.super Ljava/lang/Object;
.source "Document.java"


# instance fields
.field elements:[Lin/uncod/android/bypass/Element;


# direct methods
.method public constructor <init>([Lin/uncod/android/bypass/Element;)V
    .registers 2
    .param p1, "elements"    # [Lin/uncod/android/bypass/Element;

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lin/uncod/android/bypass/Document;->elements:[Lin/uncod/android/bypass/Element;

    .line 9
    return-void
.end method


# virtual methods
.method public getElement(I)Lin/uncod/android/bypass/Element;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 16
    iget-object v0, p0, Lin/uncod/android/bypass/Document;->elements:[Lin/uncod/android/bypass/Element;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getElementCount()I
    .registers 2

    .prologue
    .line 12
    iget-object v0, p0, Lin/uncod/android/bypass/Document;->elements:[Lin/uncod/android/bypass/Element;

    array-length v0, v0

    return v0
.end method
