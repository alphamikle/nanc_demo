String get rootViewLayout => r'''

<data id="colors" primary="#FF0B59D5" primaryDarken="#FF0A50C0" primaryDarkest="#FF0948AD"
      secondary="#FFFFFFFF" secondaryDarken="#FFCDDEF7"
      tertiary="#FFFCB61A"
      quaternary="#FF999999"/>
<data id="header" height="230"/>
<data id="gap" x1="4" x2="8" x3="16" x4="24" x5="32"/>

<sliverPersistentHeader maxExtent="{{ data(header).height }}" minExtent="{{ data(header).height }}">
  <container color="{{ data(colors).primary }}" height="{{ data(header).height }}">
    <column>
      <sizedBox height="44"/>
      <padding left="{{ data(gap).x3 }}" top="{{ data(gap).x2 }}" right="{{ data(gap).x3 }}" bottom="{{ data(gap).x2 }}">
        <row>
        <expanded>
          <row mainAxisSize="min">
            <sizedBox size="32">
              <image ref="https://raw.githubusercontent.com/alphamikle/assets/master/images/avatar.png"/>
            </sizedBox>
            <sizedBox width="{{ data(gap).x2 }}"/>
            <text text="Hi, Jonh">
              <prop:textStyle color="{{ data(colors).secondary }}" size="14" font="Ambit"/>
            </text>
          </row>
        </expanded>
        <expanded>
          <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/logo.svg"/>
        </expanded>
        <expanded>
          <row mainAxisAlignment="end">
            <text text="$499.60">
              <prop:textStyle color="{{ data(colors).secondaryDarken }}"/>
            </text>
            <sizedBox width="{{ data(gap).x2 }}"/>
            <stack>
              <padding top="4" right="4">
                <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/cart.svg"/>
              </padding>
              <positioned top="0" right="0">
                <container size="14">
                  <prop:decoration color="{{ data(colors).tertiary }}">
                    <prop:borderRadius all="14"/>
                  </prop:decoration>
                  <center>
                    <text text="2" size="9"/>
                  </center>
                </container>
              </positioned>
            </stack>
          </row>
        </expanded>
        </row>
      </padding>
      <padding all="{{ data(gap).x3 }}">
        <textField maxLines="1">
        <prop:inputDecoration filled="true" fillColor="{{ data(colors).secondary }}" dense="true" hint="Search everything at Walmart">
          <prop:inputBorder type="outline">
            <prop:borderRadius all="60"/>
            <prop:borderSide color="yellow" width="0"/>
          </prop:inputBorder>
          <prop:contentPadding left="0"/>
          <alias name="prefixIcon">
            <padding>
              <sizedBox size="24">
                <center>
                  <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/search.svg" size="24"/>
                </center>
              </sizedBox>
            </padding>
          </alias>
          <prop:hintStyle color="{{ data(colors).quaternary }}" size="14" font="Ambit">
          </prop:hintStyle>
        </prop:inputDecoration>
        </textField>
      </padding>
      <row>
        <expanded>
        <container height="36" color="{{ data(colors).primaryDarken }}">
          <row mainAxisSize="min">
            <padding left="{{ data(gap).x3 }}" right="{{ data(gap).x1 }}">
              <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/home.svg"/>
            </padding>
            <text text="Carrollton Supercenter" color="{{ data(colors).secondary }}" overflow="elipsis" maxLines="1">
              <prop:textStyle color="{{ data(colors).secondary }}" size="12" font="Aeonik"/>
            </text>
          </row>
        </container>
        </expanded>
        <expanded>
        <container height="36" color="{{ data(colors).primaryDarkest }}">
          <row mainAxisSize="min">
            <padding left="{{ data(gap).x3 }}" right="{{ data(gap).x1 }}">
              <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg"/>
            </padding>
            <text text="Dallas 75220" color="{{ data(colors).secondary }}">
              <prop:textStyle color="{{ data(colors).secondary }}" size="12" font="Aeonik"/>
            </text>
          </row>
        </container>
        </expanded>
      </row>
    </column>
  </container>
</sliverPersistentHeader>

<sizedBox height="8"/>

<for to="13">
  <padding left="8" right="8" bottom="8">
    <container height="60" color="gray"/>
  </padding>
</for>
''';
