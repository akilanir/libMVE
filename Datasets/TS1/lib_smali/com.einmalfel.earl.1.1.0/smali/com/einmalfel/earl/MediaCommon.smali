.class public Lcom/einmalfel/earl/MediaCommon;
.super Ljava/lang/Object;
.source "MediaCommon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
    }
.end annotation


# instance fields
.field public final adult:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final backLinks:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation
.end field

.field public final categories:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaCategory;",
            ">;"
        }
    .end annotation
.end field

.field public final comments:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final community:Lcom/einmalfel/earl/MediaCommunity;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final copyright:Lcom/einmalfel/earl/MediaCopyright;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final credits:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaCredit;",
            ">;"
        }
    .end annotation
.end field

.field public final description:Lcom/einmalfel/earl/MediaTitle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final embed:Lcom/einmalfel/earl/MediaEmbed;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final hash:Lcom/einmalfel/earl/MediaHash;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final keywords:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final license:Lcom/einmalfel/earl/MediaLicense;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final location:Lcom/einmalfel/earl/MediaLocation;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final peerLink:Lcom/einmalfel/earl/MediaPeerLink;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final player:Lcom/einmalfel/earl/MediaPlayer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final prices:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaPrice;",
            ">;"
        }
    .end annotation
.end field

.field public final rating:Lcom/einmalfel/earl/MediaRating;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final responses:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final restrictions:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaRestriction;",
            ">;"
        }
    .end annotation
.end field

.field public final rights:Lcom/einmalfel/earl/MediaRights;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final scenes:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaScene;",
            ">;"
        }
    .end annotation
.end field

.field public final status:Lcom/einmalfel/earl/MediaStatus;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final subTitles:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaSubTitle;",
            ">;"
        }
    .end annotation
.end field

.field public final texts:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaText;",
            ">;"
        }
    .end annotation
.end field

.field public final thumbnails:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaThumbnail;",
            ">;"
        }
    .end annotation
.end field

.field public final title:Lcom/einmalfel/earl/MediaTitle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/MediaCommon;)V
    .registers 3
    .param p1, "source"    # Lcom/einmalfel/earl/MediaCommon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->adult:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->adult:Ljava/lang/Boolean;

    .line 265
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->rating:Lcom/einmalfel/earl/MediaRating;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->rating:Lcom/einmalfel/earl/MediaRating;

    .line 266
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->title:Lcom/einmalfel/earl/MediaTitle;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->title:Lcom/einmalfel/earl/MediaTitle;

    .line 267
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->description:Lcom/einmalfel/earl/MediaTitle;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->description:Lcom/einmalfel/earl/MediaTitle;

    .line 268
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->keywords:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->keywords:Ljava/util/List;

    .line 269
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->thumbnails:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->thumbnails:Ljava/util/List;

    .line 270
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->categories:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->categories:Ljava/util/List;

    .line 271
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->hash:Lcom/einmalfel/earl/MediaHash;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->hash:Lcom/einmalfel/earl/MediaHash;

    .line 272
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->player:Lcom/einmalfel/earl/MediaPlayer;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->player:Lcom/einmalfel/earl/MediaPlayer;

    .line 273
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->credits:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->credits:Ljava/util/List;

    .line 274
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->copyright:Lcom/einmalfel/earl/MediaCopyright;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->copyright:Lcom/einmalfel/earl/MediaCopyright;

    .line 275
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->texts:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->texts:Ljava/util/List;

    .line 276
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->restrictions:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->restrictions:Ljava/util/List;

    .line 277
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->community:Lcom/einmalfel/earl/MediaCommunity;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->community:Lcom/einmalfel/earl/MediaCommunity;

    .line 278
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->comments:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->comments:Ljava/util/List;

    .line 279
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->embed:Lcom/einmalfel/earl/MediaEmbed;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->embed:Lcom/einmalfel/earl/MediaEmbed;

    .line 280
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->responses:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->responses:Ljava/util/List;

    .line 281
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->backLinks:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->backLinks:Ljava/util/List;

    .line 282
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->status:Lcom/einmalfel/earl/MediaStatus;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->status:Lcom/einmalfel/earl/MediaStatus;

    .line 283
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->prices:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->prices:Ljava/util/List;

    .line 284
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->license:Lcom/einmalfel/earl/MediaLicense;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->license:Lcom/einmalfel/earl/MediaLicense;

    .line 285
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->subTitles:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->subTitles:Ljava/util/List;

    .line 286
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->peerLink:Lcom/einmalfel/earl/MediaPeerLink;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->peerLink:Lcom/einmalfel/earl/MediaPeerLink;

    .line 287
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->location:Lcom/einmalfel/earl/MediaLocation;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->location:Lcom/einmalfel/earl/MediaLocation;

    .line 288
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->rights:Lcom/einmalfel/earl/MediaRights;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->rights:Lcom/einmalfel/earl/MediaRights;

    .line 289
    iget-object v0, p1, Lcom/einmalfel/earl/MediaCommon;->scenes:Ljava/util/List;

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->scenes:Ljava/util/List;

    .line 290
    return-void
.end method

.method public constructor <init>(Ljava/lang/Boolean;Lcom/einmalfel/earl/MediaRating;Lcom/einmalfel/earl/MediaTitle;Lcom/einmalfel/earl/MediaTitle;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaHash;Lcom/einmalfel/earl/MediaPlayer;Ljava/util/List;Lcom/einmalfel/earl/MediaCopyright;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaCommunity;Ljava/util/List;Lcom/einmalfel/earl/MediaEmbed;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaStatus;Ljava/util/List;Lcom/einmalfel/earl/MediaLicense;Ljava/util/List;Lcom/einmalfel/earl/MediaPeerLink;Lcom/einmalfel/earl/MediaLocation;Lcom/einmalfel/earl/MediaRights;Ljava/util/List;)V
    .registers 29
    .param p1, "adult"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "rating"    # Lcom/einmalfel/earl/MediaRating;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "title"    # Lcom/einmalfel/earl/MediaTitle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "description"    # Lcom/einmalfel/earl/MediaTitle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p8, "hash"    # Lcom/einmalfel/earl/MediaHash;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "player"    # Lcom/einmalfel/earl/MediaPlayer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p11, "copyright"    # Lcom/einmalfel/earl/MediaCopyright;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p13    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p14, "community"    # Lcom/einmalfel/earl/MediaCommunity;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p16, "embed"    # Lcom/einmalfel/earl/MediaEmbed;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p18    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p19, "status"    # Lcom/einmalfel/earl/MediaStatus;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p20    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p21, "license"    # Lcom/einmalfel/earl/MediaLicense;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p22    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p23, "peerLink"    # Lcom/einmalfel/earl/MediaPeerLink;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p24, "location"    # Lcom/einmalfel/earl/MediaLocation;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p25, "rights"    # Lcom/einmalfel/earl/MediaRights;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p26    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            "Lcom/einmalfel/earl/MediaRating;",
            "Lcom/einmalfel/earl/MediaTitle;",
            "Lcom/einmalfel/earl/MediaTitle;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaThumbnail;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaCategory;",
            ">;",
            "Lcom/einmalfel/earl/MediaHash;",
            "Lcom/einmalfel/earl/MediaPlayer;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaCredit;",
            ">;",
            "Lcom/einmalfel/earl/MediaCopyright;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaText;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaRestriction;",
            ">;",
            "Lcom/einmalfel/earl/MediaCommunity;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/einmalfel/earl/MediaEmbed;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/net/URL;",
            ">;",
            "Lcom/einmalfel/earl/MediaStatus;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaPrice;",
            ">;",
            "Lcom/einmalfel/earl/MediaLicense;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaSubTitle;",
            ">;",
            "Lcom/einmalfel/earl/MediaPeerLink;",
            "Lcom/einmalfel/earl/MediaLocation;",
            "Lcom/einmalfel/earl/MediaRights;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaScene;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 234
    .local p5, "keywords":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "thumbnails":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaThumbnail;>;"
    .local p7, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaCategory;>;"
    .local p10, "credits":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaCredit;>;"
    .local p12, "texts":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaText;>;"
    .local p13, "restrictions":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaRestriction;>;"
    .local p15, "comments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p17, "responses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p18, "backLinks":Ljava/util/List;, "Ljava/util/List<Ljava/net/URL;>;"
    .local p20, "prices":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaPrice;>;"
    .local p22, "subTitles":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaSubTitle;>;"
    .local p26, "scenes":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaScene;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 235
    iput-object p1, p0, Lcom/einmalfel/earl/MediaCommon;->adult:Ljava/lang/Boolean;

    .line 236
    iput-object p2, p0, Lcom/einmalfel/earl/MediaCommon;->rating:Lcom/einmalfel/earl/MediaRating;

    .line 237
    iput-object p3, p0, Lcom/einmalfel/earl/MediaCommon;->title:Lcom/einmalfel/earl/MediaTitle;

    .line 238
    iput-object p4, p0, Lcom/einmalfel/earl/MediaCommon;->description:Lcom/einmalfel/earl/MediaTitle;

    .line 239
    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->keywords:Ljava/util/List;

    .line 240
    invoke-static {p6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->thumbnails:Ljava/util/List;

    .line 241
    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->categories:Ljava/util/List;

    .line 242
    iput-object p8, p0, Lcom/einmalfel/earl/MediaCommon;->hash:Lcom/einmalfel/earl/MediaHash;

    .line 243
    iput-object p9, p0, Lcom/einmalfel/earl/MediaCommon;->player:Lcom/einmalfel/earl/MediaPlayer;

    .line 244
    invoke-static {p10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->credits:Ljava/util/List;

    .line 245
    iput-object p11, p0, Lcom/einmalfel/earl/MediaCommon;->copyright:Lcom/einmalfel/earl/MediaCopyright;

    .line 246
    invoke-static {p12}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->texts:Ljava/util/List;

    .line 247
    invoke-static {p13}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->restrictions:Ljava/util/List;

    .line 248
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->community:Lcom/einmalfel/earl/MediaCommunity;

    .line 249
    invoke-static/range {p15 .. p15}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->comments:Ljava/util/List;

    .line 250
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->embed:Lcom/einmalfel/earl/MediaEmbed;

    .line 251
    invoke-static/range {p17 .. p17}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->responses:Ljava/util/List;

    .line 252
    invoke-static/range {p18 .. p18}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->backLinks:Ljava/util/List;

    .line 253
    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->status:Lcom/einmalfel/earl/MediaStatus;

    .line 254
    invoke-static/range {p20 .. p20}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->prices:Ljava/util/List;

    .line 255
    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->license:Lcom/einmalfel/earl/MediaLicense;

    .line 256
    invoke-static/range {p22 .. p22}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->subTitles:Ljava/util/List;

    .line 257
    move-object/from16 v0, p23

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->peerLink:Lcom/einmalfel/earl/MediaPeerLink;

    .line 258
    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->location:Lcom/einmalfel/earl/MediaLocation;

    .line 259
    move-object/from16 v0, p25

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon;->rights:Lcom/einmalfel/earl/MediaRights;

    .line 260
    invoke-static/range {p26 .. p26}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/MediaCommon;->scenes:Ljava/util/List;

    .line 261
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCommon;
    .registers 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    new-instance v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    invoke-direct {v0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;-><init>()V

    .line 215
    .local v0, "builder":Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
    :goto_5
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_10

    .line 216
    invoke-virtual {v0, p0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    goto :goto_5

    .line 218
    :cond_10
    invoke-virtual {v0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->build()Lcom/einmalfel/earl/MediaCommon;

    move-result-object v1

    return-object v1
.end method
