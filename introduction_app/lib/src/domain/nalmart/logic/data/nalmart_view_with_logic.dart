const String nalmartLayoutWithLogic = '''
<data namespace="colors" primary="#FF0B59D5" primaryDarken="#FF0A50C0" primaryDarkest="#FF0948AD"
      secondary="#FFFFFFFF" secondaryDarken="#FFCDDEF7" secondaryAccent="#FFE9F2F9"
      tertiary="#FFFCB61A"
      quaternary="#FF999999" quaternaryDarken="#FF696E70" quaternaryLighten="#FFEEEEEE"
      text.basic="#FF000000" text.light="#FFDCDCDC"
/>
<data namespace="header" height="215"/>
<data namespace="gap" x1="4" x2="8" x3="16" x4="24" x5="32" x6="48"/>

<data namespace="font" main="DM Sans"/>
<data namespace="star"
      empty="{{ page.icons.star.empty }}"
      half="{{ page.icons.star.half }}"
      full="{{ page.icons.star.full }}"
/>
<data cart.count="{{ page.header.items_in_cart }}"/>

<!-- # TEMPLATES-->
<template id="adCard">
  <padding top="12" bottom="12">
    <row mainAxisSize="min">
      <show ifFalse="{{ template.noPrefix }}">
        <sizedBox width="{{ data.gap.x3 }}"/>
      </show>
      <aspectRatio ratio="1.3">
        <container color="{{ data.colors.secondary }}">
          <prop:decoration>
            <prop:borderRadius all="8"/>
            <prop:shadow color="#0F000000" blurRadius="8" offsetY="4"/>
          </prop:decoration>

          <column crossAxisAlignment="start">
            <expanded>
              <clipRRect topLeft="8" topRight="8">
                <image ref="{{ template.image }}" fit="cover" blurHash="{{ template.blurHash }}"/>
              </clipRRect>
            </expanded>
            <padding all="{{ data.gap.x2 }}">
              <row>
                <sizedBox width="{{ data.gap.x2 }}"/>
                <column crossAxisAlignment="start">
                  <component id="subtitle" text="{{ template.title }}"/>
                  <component id="smallBody" text="{{ template.subtitle }}"/>
                </column>
                <spacer/>
                <padding top="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}">
                  <sizedBox size="24">
                    <!--TODO: REPLACE ICON-->
                    <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/circle_chevron_right.svg"/>
                  </sizedBox>
                </padding>
              </row>
            </padding>
          </column>
        </container>
      </aspectRatio>
      <sizedBox width="{{ data.gap.x3 }}"/>
    </row>
  </padding>
</template>

<template id="subtitle">
  <text text="{{ template.text }}" size="18">
    <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
  </text>
</template>

<template id="smallBody">
  <show ifTrue="{{ template.color }}">
    <text text="{{ template.text }}" size="12" color="{{ template.color }}">
      <prop:textStyle font="{{ data.font.main }}"/>
    </text>
  </show>
  <show ifFalse="{{ template.color }}" nullAsFalse="true">
    <text text="{{ template.text }}" size="12" color="{{ data.colors.quaternary }}">
      <prop:textStyle font="{{ data.font.main }}"/>
    </text>
  </show>
</template>

<template id="middleBody">
  <text text="{{ template.text }}" size="14" color="{{ data.colors.text.basic }}" maxLines="2" overflow="ellipsis">
    <prop:textStyle font="{{ data.font.main }}"/>
  </text>
</template>

<template id="roundButton">
  <stack>
    <container>
      <prop:decoration color="{{ template.color }}">
        <prop:borderRadius all="30"/>
      </prop:decoration>

      <padding left="6" top="6" right="6" bottom="6">
        <row mainAxisSize="min">
          <show ifTrue="{{ template.prefix }}">
            <padding left="2" right="4">
              <sizedBox size="20">
                <center>
                  <svg ref="{{ template.prefix }}"/>
                </center>
              </sizedBox>
            </padding>
          </show>
          <show ifFalse="{{ template.prefix }}" nullAsFalse="true">
            <sizedBox width="6"/>
          </show>
          <text text="{{ template.text }}" size="14">
            <prop:textStyle font="{{ data.font.main }}" color="{{ template.textColor }}" weight="w600"/>
          </text>
          <show ifTrue="{{ template.suffix }}">
            <padding left="6" right="6">
              <sizedBox size="10">
                <svg ref="{{ template.suffix }}"/>
              </sizedBox>
            </padding>
          </show>
          <show ifFalse="{{ template.suffix }}" nullAsFalse="true">
            <sizedBox width="6"/>
          </show>
        </row>
      </padding>
    </container>
    <show ifTrue="{{ template.onPressed }}">
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="30"/>
          <inkWell onPressed="{{ template.onPressed }}">
            <prop:borderRadius all="30"/>
          </inkWell>
        </material>
      </positioned>
    </show>
  </stack>
</template>

<template id="point">
  <show ifTrue="{{ template.active }}">
    <show ifTrue="{{ template.current }}">
      <container size="20">
        <prop:decoration color="{{ data.colors.primary }}">
          <prop:borderRadius all="20"/>
        </prop:decoration>
        <center>
          <container size="16">
            <prop:decoration color="{{ data.colors.secondary }}">
              <prop:borderRadius all="16"/>
            </prop:decoration>
            <center>
              <container size="12">
                <prop:decoration color="{{ data.colors.primary }}">
                  <prop:borderRadius all="12"/>
                </prop:decoration>
              </container>
            </center>
          </container>
        </center>
      </container>
    </show>
    <show ifFalse="{{ template.current }}" nullAsFalse="true">
      <sizedBox height="20">
        <center>
          <container size="12">
            <prop:decoration color="{{ data.colors.primary }}">
              <prop:borderRadius all="12"/>
            </prop:decoration>
          </container>
        </center>
      </sizedBox>
    </show>
  </show>
  <show ifFalse="{{ template.active }}">
    <sizedBox height="20">
      <center>
        <container size="12">
          <prop:decoration color="{{ data.colors.quaternaryDarken }}">
            <prop:borderRadius all="12"/>
          </prop:decoration>
        </container>
      </center>
    </sizedBox>
  </show>
</template>

<template id="leftDot">
  <stack>
    <positioned left="11" top="10" right="0">
      <component id="line" active="{{ template.active }}"/>
    </positioned>

    <positioned left="0" top="1">
      <component id="point" active="{{ template.active }}"/>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.primary }}" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.quaternaryDarken }}" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="dot">
  <stack>
    <positioned left="0" top="10" right="0">
      <row>
        <expanded>
          <component id="line" active="{{ template.leftActive }}"/>
        </expanded>
        <expanded>
          <component id="line" active="{{ template.rightActive }}"/>
        </expanded>
      </row>
    </positioned>

    <positioned left="0" top="1" right="0">
      <align align="topCenter">
        <component id="point" active="{{ template.active }}" current="{{ template.current }}"/>
      </align>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.primary }}" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.quaternaryDarken }}" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="rightDot">
  <stack>
    <positioned left="0" top="10" right="11">
      <component id="line" active="{{ template.active }}"/>
    </positioned>

    <positioned top="1" right="0">
      <component id="point" active="{{ template.active }}"/>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.primary }}" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.quaternaryDarken }}" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="line">
  <show ifTrue="{{ template.active }}">
    <container height="2" width="100">
      <prop:decoration color="{{ data.colors.primary }}"/>
    </container>
  </show>
  <show ifFalse="{{ template.active }}">
    <container height="2" width="100">
      <prop:decoration color="{{ data.colors.quaternaryDarken }}"/>
    </container>
  </show>
</template>

<template id="lineSpacer">
  <sizedBox height="50">
    <stack fix="expand">
      <positioned left="0" top="10" right="0">
        <component id="line" active="{{ template.active }}"/>
      </positioned>
    </stack>
  </sizedBox>
</template>

<template id="groceryCard">
  <aspectRatio ratio="0.65">
    <stack>
      <container>
        <prop:decoration>
          <prop:border color="{{ data.colors.quaternaryLighten }}" width="1.6"/>
          <prop:borderRadius all="8"/>
        </prop:decoration>
        <column crossAxisAlignment="start">
          <expanded>
            <center>
              <padding top="4" bottom="4">
                <image ref="{{ template.image }}" blurHash="{{ template.blurHash }}"/>
              </padding>
            </center>
          </expanded>
          <expanded>
            <column crossAxisAlignment="start">
              <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}" bottom="{{ data.gap.x2 }}">
                <column crossAxisAlignment="start">
                  <component id="smallBody" text="{{ template.subtitle }}"/>
                  <component id="middleBody" text="{{ template.title }}"/>
                  <sizedBox height="{{ data.gap.x2 }}"/>
                  <richText>
                    <textSpan text="{{ template.price }}">
                      <prop:textStyle color="{{ data.colors.text.basic }}" size="14"/>
                    </textSpan>
                    <textSpan text="  {{ template.pricePerUnit }}">
                      <prop:textStyle color="{{ data.colors.text.light }}" size="14"/>
                    </textSpan>
                  </richText>
                </column>
              </padding>
              <container height="1.6" width="500" color="{{ data.colors.quaternaryLighten }}"/>
              <expanded>
                <center>
                  <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}">
                    <row>
                      <show ifTrue="{{ template.inStock }}">
                        <component id="smallBody" text="In stock" color="{{ data.colors.text.basic }}"/>
                      </show>
                      <show ifFalse="{{ template.inStock }}" nullAsFalse="true">
                        <component id="smallBody" text="Out of stock" color="{{ data.colors.text.basic }}"/>
                      </show>
                      <padding left="8" right="8">
                        <container width="1" height="14" color="{{ data.colors.text.basic }}"/>
                      </padding>
                      <sizedBox size="20">
                        <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location_dark.svg"/>
                      </sizedBox>
                      <sizedBox width="2"/>
                      <component id="smallBody" text="S23" color="{{ data.colors.text.basic }}"/>
                    </row>
                  </padding>
                </center>
              </expanded>
            </column>
          </expanded>
        </column>
      </container>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="8"/>
          <inkWell onPressed="{{ template.onPressed }}" splashColor="{{ template.splashColor }}" highlightColor="#00FFFFFF">
            <prop:borderRadius all="8"/>
            <container color="#00FFFFFF"/>
          </inkWell>
        </material>
      </positioned>
      <positioned top="8" right="8">
        <component id="roundButton" text="Add" color="{{ data.colors.primary }}" textColor="{{ data.colors.secondary }}"
                   prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg" onPressed="addToCart"/>
      </positioned>
    </stack>
  </aspectRatio>
</template>

<template id="star">
  <padding right="{{ data.gap.x1 }}">
    <sizedBox size="16">
      <svg ref="{{ template.ref }}"/>
    </sizedBox>
  </padding>
</template>

<template id="rating">
  <row>
    <!-- # FIRST STAR -->
    <show ifTrue="{{ template.rating < 0.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 0.5 and template.rating < 1 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 1 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # SECOND STAR -->
    <show ifTrue="{{ template.rating < 1.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 1.5 and template.rating < 2 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 2 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # THIRD STAR -->
    <show ifTrue="{{ template.rating < 2.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 2.5 and template.rating < 3 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 3 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # FOURTH STAR -->
    <show ifTrue="{{ template.rating < 3.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 3.5 and template.rating < 4 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 4 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # FIFTH STAR -->
    <show ifTrue="{{ template.rating < 4.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 4.5 and template.rating < 5 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 5 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>
  </row>
</template>

<template id="electronicsCard">
  <aspectRatio ratio="0.65">
    <stack>
      <container>
        <prop:decoration>
          <prop:border color="{{ data.colors.quaternaryLighten }}" width="1.6"/>
          <prop:borderRadius all="8"/>
        </prop:decoration>
        <column crossAxisAlignment="start">
          <expanded>
            <center>
              <padding top="4" bottom="4">
                <image ref="{{ template.image }}" blurHash="{{ template.blurHash }}"/>
              </padding>
            </center>
          </expanded>
          <expanded>
            <column crossAxisAlignment="start">
              <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}" bottom="{{ data.gap.x2 }}">
                <column crossAxisAlignment="start">
                  <component id="smallBody" text="{{ template.subtitle }}"/>
                  <component id="middleBody" text="{{ template.title }}"/>
                  <sizedBox height="{{ data.gap.x2 }}"/>
                  <richText>
                    <textSpan text="{{ template.pricePerMonth }}">
                      <prop:textStyle color="{{ data.colors.text.basic }}" size="14"/>
                    </textSpan>
                    <textSpan text="  {{ template.price }}">
                      <prop:textStyle color="{{ data.colors.text.light }}" size="14"/>
                    </textSpan>
                  </richText>
                </column>
              </padding>
              <container height="1.6" width="500" color="{{ data.colors.quaternaryLighten }}"/>
              <expanded>
                <center>
                  <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}">
                    <row>
                      <component id="rating" rating="{{ template.rating }}"/>
                      <sizedBox width="{{ data.gap.x1 }}"/>
                      <component id="smallBody" text="({{ template.count }})" color="{{ data.colors.text.light }}"/>
                    </row>
                  </padding>
                </center>
              </expanded>
            </column>
          </expanded>
        </column>
      </container>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="8"/>
          <inkWell onPressed="{{ template.onPressed }}" splashColor="{{ template.splashColor }}" highlightColor="#00FFFFFF">
            <prop:borderRadius all="8"/>
            <container color="#00FFFFFF"/>
          </inkWell>
        </material>
      </positioned>
      <positioned top="8" right="8">
        <component id="roundButton" text="Add" color="{{ data.colors.primary }}" textColor="{{ data.colors.secondary }}"
                   prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg" onPressed="addToCart"/>
      </positioned>
    </stack>
  </aspectRatio>
</template>

<template id="brand">
  <padding right="{{ data.gap.x3 }}">
    <stack>
      <sizedBox size="72">
        <svg ref="{{ template.image }}"/>
      </sizedBox>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="100"/>
          <inkWell onPressed="snackbar: Brand!">
            <prop:borderRadius all="100"/>
            <container color="#00FFFFFF"/>
          </inkWell>
        </material>
      </positioned>
    </stack>
  </padding>
</template>

<!-- # HEADER-->
<sliverPersistentHeader maxExtent="{{ data.header.height }}" minExtent="{{ data.header.height }}" floating="true">
  <container color="{{ data.colors.primary }}" height="{{ data.header.height }}">
    <column>
      <sizedBox height="44"/>
      <padding left="{{ data.gap.x3 }}" top="{{ data.gap.x2 }}" right="{{ data.gap.x3 }}" bottom="{{ data.gap.x2 }}">
        <row>
          <expanded>
            <row mainAxisSize="min">
              <sizedBox size="32">
                <image ref="{{ page.header.avatar_image }}"/>
              </sizedBox>
              <sizedBox width="{{ data.gap.x2 }}"/>
              <text text="{{ page.header.greetings }}">
                <prop:textStyle color="{{ data.colors.secondary }}" size="14" font="{{ data.font.main }}"/>
              </text>
            </row>
          </expanded>
          <expanded>
            <sizedBox size="39">
              <svg ref="{{ page.header.logo_image }}"/>
            </sizedBox>
          </expanded>
          <expanded>
            <row mainAxisAlignment="end">
              <text text="{{ page.header.cart_amount }}">
                <prop:textStyle color="{{ data.colors.secondaryDarken }}"/>
              </text>
              <sizedBox width="{{ data.gap.x2 }}"/>
              <stack>
                <padding top="4" right="4">
                  <sizedBox size="24">
                    <svg ref="{{ page.icons.cart }}"/>
                  </sizedBox>
                </padding>
                <positioned top="0" right="0">
                  <container size="14">
                    <prop:decoration color="{{ data.colors.tertiary }}">
                      <prop:borderRadius all="14"/>
                    </prop:decoration>
                    <center>
                      <dataBuilder buildWhen="cart.count">
                        <text text="{{ data.cart.count }}" size="9"/>
                      </dataBuilder>
                    </center>
                  </container>
                </positioned>
              </stack>
            </row>
          </expanded>
        </row>
      </padding>
      <padding all="{{ data.gap.x3 }}">
        <textField maxLines="1" onChanged="emit:search">
          <prop:inputDecoration filled="true" simpleBorders="true" fillColor="{{ data.colors.secondary }}" dense="false"
                                hint="{{ page.search.search_field_hint }}">
            <prop:inputBorder type="outline">
              <prop:borderRadius all="60"/>
              <prop:borderSide color="#00FFFFFF" width="0"/>
            </prop:inputBorder>
            <prop:contentPadding left="30"/>
            <alias name="prefixIcon">
              <padding left="8" top="3">
                <sizedBox size="21">
                  <center>
                    <svg ref="{{ page.icons.search }}" size="21"/>
                  </center>
                </sizedBox>
              </padding>
            </alias>
            <prop:hintStyle color="{{ data.colors.quaternary }}" size="14" font="{{ data.font.main }}"/>
            <alias name="suffixIcon">
              <padding right="8">
                <sizedBox size="21">
                  <center>
                    <material type="transparency">
                      <prop:borderRadius all="3"/>
                      <inkWell onPressed="snackbar: Let's go scan!">
                        <prop:borderRadius all="3"/>
                        <svg ref="{{ page.icons.barcode }}" size="21"/>
                      </inkWell>
                    </material>
                  </center>
                </sizedBox>
              </padding>
            </alias>
          </prop:inputDecoration>
        </textField>
      </padding>
      <row>
        <expanded>
          <container height="36" color="{{ data.colors.primaryDarken }}">
            <row mainAxisSize="min">
              <padding left="{{ data.gap.x3 }}" right="{{ data.gap.x1 }}">
                <sizedBox size="20">
                  <svg ref="{{ page.icons.home }}"/>
                </sizedBox>
              </padding>
              <text text="{{ page.address.shop_name }}" color="{{ data.colors.secondary }}" overflow="ellipsis" maxLines="1">
                <prop:textStyle color="{{ data.colors.secondary }}" size="12" font="{{ data.font.main }}"/>
              </text>
            </row>
          </container>
        </expanded>
        <expanded>
          <container height="36" color="{{ data.colors.primaryDarkest }}">
            <row mainAxisSize="min">
              <padding left="{{ data.gap.x3 }}" right="{{ data.gap.x1 }}">
                <sizedBox size="20">
                  <svg ref="{{ page.icons.geo }}"/>
                </sizedBox>
              </padding>
              <text text="{{ page.address.shop_address }}" color="{{ data.colors.secondary }}">
                <prop:textStyle color="{{ data.colors.secondary }}" size="12" font="{{ data.font.main }}"/>
              </text>
            </row>
          </container>
        </expanded>
      </row>
    </column>
  </container>
</sliverPersistentHeader>

<visibilityNotifier onShow="created">
  <sizedBox height="{{ data.gap.x1 }}"/>
</visibilityNotifier>

<!-- # AD CARDS-->
<sizedBox height="280">
  <dataBuilder buildWhen="ads">
    <listView axis="horizontal">
      <for in="{{ data.ads }}">
        <component id="adCard" image="{{ cycle.value.image }}"
                   title="{{ cycle.value.title }}" noPrefix="{{ cycle.index }}" subtitle="{{ cycle.value.description }}" blurHash="{{ cycle.value.blur_hash }}"/>
      </for>
    </listView>
  </dataBuilder>
</sizedBox>

<!-- # DELIVERY INFO-->
<padding left="{{ data.gap.x3 }}" top="{{ data.gap.x5 }}" right="{{ data.gap.x3 }}">
  <dataBuilder buildWhen="order.statuses">
    <column mainAxisSize="min" crossAxisAlignment="start">
      <row>
        <column mainAxisSize="min" crossAxisAlignment="start">
          <component id="subtitle" text="{{ data.order.title }}"/>
          <component id="smallBody" text="{{ data.order.arrival_time }}"/>
        </column>
        <spacer/>
        <component id="roundButton" text="{{ page.buttons.track.title }}" prefix="{{ page.icons.geo }}"
                   color="{{ data.colors.primary }}" textColor="{{ data.colors.secondary }}" onPressed="snackbar: Go to track!"/>
      </row>
      <sizedBox height="{{ data.gap.x4 }}"/>
      <row>
        <component id="leftDot"
                   active="{{ data.order.statuses.placed.is_active }}"
                   current="{{ data.order.statuses.placed.is_current }}"
                   title="{{ data.order.statuses.placed.title }}"/>
        <expanded>
          <component id="lineSpacer" active="{{ data.order.statuses.preparing.is_active }}"/>
        </expanded>
  
        <component id="dot"
                   leftActive="{{ data.order.statuses.placed.is_active }}"
                   active="{{ data.order.statuses.preparing.is_active }}"
                   current="{{ data.order.statuses.preparing.is_current }}"
                   rightActive="{{ data.order.statuses.on_the_way.is_active }}"
                   title="{{ data.order.statuses.preparing.title }}"/>
        <expanded>
          <component id="lineSpacer" active="{{ data.order.statuses.on_the_way.is_active }}"/>
        </expanded>
  
        <component id="dot"
                   leftActive="{{ data.order.statuses.placed.is_active }}"
                   active="{{ data.order.statuses.on_the_way.is_active }}"
                   current="{{ data.order.statuses.on_the_way.is_current }}"
                   rightActive="{{ data.order.statuses.delivered.is_active }}"
                   title="{{ data.order.statuses.on_the_way.title }}"/>
        <expanded>
          <component id="lineSpacer" active="{{ data.order.statuses.delivered.is_active }}"/>
        </expanded>
  
        <component id="rightDot"
                   active="{{ data.order.statuses.delivered.is_active }}"
                   current="{{ data.order.statuses.delivered.is_current }}"
                   title="{{ data.order.statuses.delivered.title }}"/>
      </row>
    </column>
  </dataBuilder>
</padding>

<sizedBox height="{{ data.gap.x4 }}"/>

<!-- # FILTER CHIPS -->
<sizedBox height="34">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <for in="{{ page.filter_buttons }}">
      <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="{{ cycle.value.title }}" onPressed="{{ cycle.value.action }}"
                 prefix="{{ cycle.value.prefix_icon }}" suffix="{{ cycle.value.postfix_icon }}"/>
      <show ifFalse="{{ cycle.isLast }}">
        <sizedBox width="{{ data.gap.x2 }}"/>
      </show>
      <show ifTrue="{{ cycle.isLast }}">
        <sizedBox width="{{ data.gap.x3 }}"/>
      </show>
    </for>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x4 }}"/>

<!-- # GROCERIES -->
<padding left="{{ data.gap.x3 }}" right="{{ data.gap.x3 }}">
  <richText>
    <textSpan text="{{ page.groceries_header.title }}" size="18" color="{{ data.colors.text.basic }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
    <textSpan text="{{ page.groceries_header.amount }}" size="18" color="{{ data.colors.text.light }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
  </richText>
</padding>

<sizedBox height="{{ data.gap.x3 }}"/>

<sizedBox height="252">
  <listView axis="horizontal">
    <for in="{{ page.groceries_list }}">
      <sizedBox width="{{ data.gap.x3 }}"/>
      <component id="groceryCard" image="{{ cycle.value.image }}" subtitle="{{ cycle.value.subtitle }}" title="{{ cycle.value.title }}" price="{{ cycle.value.price }}"
                 pricePerUnit="{{ cycle.value.price_per_unit }}" inStock="{{ cycle.value.is_in_stock }}" onPressed="{{ cycle.value.action }}" splashColor="{{ cycle.value.color }}"/>
    </for>
    <sizedBox width="{{ data.gap.x3 }}"/>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x5 }}"/>

<!-- # BRANDS -->
<padding left="{{ data.gap.x3 }}" right="{{ data.gap.x3 }}" bottom="{{ data.gap.x4 }}">
  <component id="subtitle" text="{{ page.brands_header.title }}"/>
</padding>

<sizedBox height="72">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <for in="{{ page.brands_list }}">
      <component id="brand" image="{{ cycle.value.image }}"/>
    </for>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x6 }}"/>

<!-- # ELECTRONICS -->
<padding left="{{ data.gap.x3 }}" right="{{ data.gap.x3 }}">
  <richText>
    <textSpan text="{{ page.electronics_header.title }}" size="18" color="{{ data.colors.text.basic }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
    <textSpan text="{{ page.electronics_header.amount }}" size="18" color="{{ data.colors.text.light }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
  </richText>
</padding>

<sizedBox height="{{ data.gap.x3 }}"/>

<sizedBox height="252">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <for in="{{ page.electronics_list }}">
      <component id="electronicsCard" image="{{ cycle.value.image }}" subtitle="{{ cycle.value.subtitle }}" title="{{ cycle.value.title }}" price="{{ cycle.value.price }}"
                 pricePerMonth="{{ cycle.value.price_per_month }}" onPressed="{{ cycle.value.action }}" splashColor="{{ cycle.value.color }}" rating="{{ cycle.value.rating }}"
                 count="{{ cycle.value.reviews_count }}"/>
      <sizedBox width="{{ data.gap.x3 }}"/>
    </for>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x5 }}"/>

<sizedBox height="100"/>
''';
