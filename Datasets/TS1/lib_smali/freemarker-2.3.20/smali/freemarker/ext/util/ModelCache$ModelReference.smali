.class final Lfreemarker/ext/util/ModelCache$ModelReference;
.super Ljava/lang/ref/SoftReference;
.source "ModelCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/util/ModelCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ModelReference"
.end annotation


# instance fields
.field object:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateModel;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .registers 4
    .param p1, "ref"    # Lfreemarker/template/TemplateModel;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "refQueue"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 175
    invoke-direct {p0, p1, p3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 176
    iput-object p2, p0, Lfreemarker/ext/util/ModelCache$ModelReference;->object:Ljava/lang/Object;

    .line 177
    return-void
.end method


# virtual methods
.method getModel()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 181
    invoke-virtual {p0}, Lfreemarker/ext/util/ModelCache$ModelReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method
