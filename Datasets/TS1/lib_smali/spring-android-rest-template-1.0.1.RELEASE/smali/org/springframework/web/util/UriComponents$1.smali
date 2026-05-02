.class final Lorg/springframework/web/util/UriComponents$1;
.super Ljava/lang/Object;
.source "UriComponents.java"

# interfaces
.implements Lorg/springframework/web/util/UriComponents$PathComponent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/web/util/UriComponents;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 948
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;)Lorg/springframework/web/util/UriComponents$PathComponent;
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 959
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 971
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public expand(Lorg/springframework/web/util/UriComponents$UriTemplateVariables;)Lorg/springframework/web/util/UriComponents$PathComponent;
    .registers 2
    .param p1, "uriVariables"    # Lorg/springframework/web/util/UriComponents$UriTemplateVariables;

    .prologue
    .line 966
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 951
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPathSegments()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 955
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 976
    const/16 v0, 0x2a

    return v0
.end method

.method public verify()V
    .registers 1

    .prologue
    .line 963
    return-void
.end method
