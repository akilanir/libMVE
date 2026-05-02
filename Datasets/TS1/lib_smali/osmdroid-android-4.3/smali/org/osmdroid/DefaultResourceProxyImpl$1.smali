.class synthetic Lorg/osmdroid/DefaultResourceProxyImpl$1;
.super Ljava/lang/Object;
.source "DefaultResourceProxyImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/DefaultResourceProxyImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$osmdroid$ResourceProxy$string:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 50
    invoke-static {}, Lorg/osmdroid/ResourceProxy$string;->values()[Lorg/osmdroid/ResourceProxy$string;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    :try_start_9
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->mapnik:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_14f

    :goto_14
    :try_start_14
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->cyclemap:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_14c

    :goto_1f
    :try_start_1f
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->public_transport:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_149

    :goto_2a
    :try_start_2a
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->cloudmade_standard:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_146

    :goto_35
    :try_start_35
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->cloudmade_small:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_143

    :goto_40
    :try_start_40
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->mapquest_osm:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_140

    :goto_4b
    :try_start_4b
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->mapquest_aerial:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_13d

    :goto_56
    :try_start_56
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->bing:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_56 .. :try_end_62} :catch_13a

    :goto_62
    :try_start_62
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->mapbox:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_6e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_62 .. :try_end_6e} :catch_137

    :goto_6e
    :try_start_6e
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->fiets_nl:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6e .. :try_end_7a} :catch_134

    :goto_7a
    :try_start_7a
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->base_nl:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_86
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7a .. :try_end_86} :catch_131

    :goto_86
    :try_start_86
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->roads_nl:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_92
    .catch Ljava/lang/NoSuchFieldError; {:try_start_86 .. :try_end_92} :catch_12e

    :goto_92
    :try_start_92
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->unknown:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_9e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_92 .. :try_end_9e} :catch_12b

    :goto_9e
    :try_start_9e
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_meters:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_aa
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9e .. :try_end_aa} :catch_129

    :goto_aa
    :try_start_aa
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_kilometers:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_b6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_aa .. :try_end_b6} :catch_127

    :goto_b6
    :try_start_b6
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_miles:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_c2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b6 .. :try_end_c2} :catch_125

    :goto_c2
    :try_start_c2
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_nautical_miles:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_ce
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c2 .. :try_end_ce} :catch_123

    :goto_ce
    :try_start_ce
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_feet:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_da
    .catch Ljava/lang/NoSuchFieldError; {:try_start_ce .. :try_end_da} :catch_121

    :goto_da
    :try_start_da
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->online_mode:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_e6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_da .. :try_end_e6} :catch_11f

    :goto_e6
    :try_start_e6
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->offline_mode:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_f2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e6 .. :try_end_f2} :catch_11d

    :goto_f2
    :try_start_f2
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->my_location:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_fe
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f2 .. :try_end_fe} :catch_11b

    :goto_fe
    :try_start_fe
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->compass:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_10a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_fe .. :try_end_10a} :catch_119

    :goto_10a
    :try_start_10a
    sget-object v0, Lorg/osmdroid/DefaultResourceProxyImpl$1;->$SwitchMap$org$osmdroid$ResourceProxy$string:[I

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->map_mode:Lorg/osmdroid/ResourceProxy$string;

    invoke-virtual {v1}, Lorg/osmdroid/ResourceProxy$string;->ordinal()I

    move-result v1

    const/16 v2, 0x17

    aput v2, v0, v1
    :try_end_116
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10a .. :try_end_116} :catch_117

    :goto_116
    return-void

    :catch_117
    move-exception v0

    goto :goto_116

    :catch_119
    move-exception v0

    goto :goto_10a

    :catch_11b
    move-exception v0

    goto :goto_fe

    :catch_11d
    move-exception v0

    goto :goto_f2

    :catch_11f
    move-exception v0

    goto :goto_e6

    :catch_121
    move-exception v0

    goto :goto_da

    :catch_123
    move-exception v0

    goto :goto_ce

    :catch_125
    move-exception v0

    goto :goto_c2

    :catch_127
    move-exception v0

    goto :goto_b6

    :catch_129
    move-exception v0

    goto :goto_aa

    :catch_12b
    move-exception v0

    goto/16 :goto_9e

    :catch_12e
    move-exception v0

    goto/16 :goto_92

    :catch_131
    move-exception v0

    goto/16 :goto_86

    :catch_134
    move-exception v0

    goto/16 :goto_7a

    :catch_137
    move-exception v0

    goto/16 :goto_6e

    :catch_13a
    move-exception v0

    goto/16 :goto_62

    :catch_13d
    move-exception v0

    goto/16 :goto_56

    :catch_140
    move-exception v0

    goto/16 :goto_4b

    :catch_143
    move-exception v0

    goto/16 :goto_40

    :catch_146
    move-exception v0

    goto/16 :goto_35

    :catch_149
    move-exception v0

    goto/16 :goto_2a

    :catch_14c
    move-exception v0

    goto/16 :goto_1f

    :catch_14f
    move-exception v0

    goto/16 :goto_14
.end method
