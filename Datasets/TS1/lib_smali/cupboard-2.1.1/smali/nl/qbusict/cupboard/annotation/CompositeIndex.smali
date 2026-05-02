.class public interface abstract annotation Lnl/qbusict/cupboard/annotation/CompositeIndex;
.super Ljava/lang/Object;
.source "CompositeIndex.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lnl/qbusict/cupboard/annotation/CompositeIndex;
        ascending = true
        order = 0x0
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final DEFAULT_ASCENDING:Z = true

.field public static final DEFAULT_INDEX_NAME:Ljava/lang/String; = ""

.field public static final DEFAULT_ORDER:I


# virtual methods
.method public abstract ascending()Z
.end method

.method public abstract indexName()Ljava/lang/String;
.end method

.method public abstract order()I
.end method
