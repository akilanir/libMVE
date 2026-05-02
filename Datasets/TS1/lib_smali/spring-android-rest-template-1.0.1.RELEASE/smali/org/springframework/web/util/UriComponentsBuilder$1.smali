.class final Lorg/springframework/web/util/UriComponentsBuilder$1;
.super Ljava/lang/Object;
.source "UriComponentsBuilder.java"

# interfaces
.implements Lorg/springframework/web/util/UriComponentsBuilder$PathComponentBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/web/util/UriComponentsBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 577
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public appendPath(Ljava/lang/String;)Lorg/springframework/web/util/UriComponentsBuilder$PathComponentBuilder;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 584
    new-instance v0, Lorg/springframework/web/util/UriComponentsBuilder$FullPathComponentBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/springframework/web/util/UriComponentsBuilder$FullPathComponentBuilder;-><init>(Ljava/lang/String;Lorg/springframework/web/util/UriComponentsBuilder$1;)V

    return-object v0
.end method

.method public varargs appendPathSegments([Ljava/lang/String;)Lorg/springframework/web/util/UriComponentsBuilder$PathComponentBuilder;
    .registers 4
    .param p1, "pathSegments"    # [Ljava/lang/String;

    .prologue
    .line 588
    new-instance v0, Lorg/springframework/web/util/UriComponentsBuilder$PathSegmentComponentBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/springframework/web/util/UriComponentsBuilder$PathSegmentComponentBuilder;-><init>([Ljava/lang/String;Lorg/springframework/web/util/UriComponentsBuilder$1;)V

    return-object v0
.end method

.method public build()Lorg/springframework/web/util/UriComponents$PathComponent;
    .registers 2

    .prologue
    .line 580
    sget-object v0, Lorg/springframework/web/util/UriComponents;->NULL_PATH_COMPONENT:Lorg/springframework/web/util/UriComponents$PathComponent;

    return-object v0
.end method
