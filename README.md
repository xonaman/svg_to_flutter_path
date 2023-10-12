# svg_to_flutter_path

Convert SVG Paths (the string inside the d attribute) to Flutter Paths.

[Online Demo](https://dev.robertmainzer.de/svg-to-flutter-path/)

## Example

<b>SVG Path:</b><br>
`M97.25 53.32 45.57 73.61c-.07.02-.13.05-.2.06-1.49.43-2.74 1.1-3.55 1.84-.8.75-1.25 1.52-1.25 2.89 0 2.36 1.84 4.2 4.2 4.2h20.55l20.69-8.28c1.03-.54 2.3-.14 2.84.88.54 1.03.14 2.29-.88 2.84-.12.06-.25.12-.38.16l-21.01 8.41c-.25.12-.52.18-.79.2H44.78c-4.62 0-8.41-3.79-8.41-8.41 0-.93.19-1.75.46-2.57-.82-.31-6.41-2.39-12.87-4.79-3.46-1.29-6.95-2.58-9.59-3.55-1.32-.49-2.43-.89-3.22-1.18-.4-.15-.7-.32-.92-.4-.09-.03-.15-.05-.2-.06-.32-.07-.64-.06-.99-.06-2.34 0-4.2 1.86-4.2 4.2 0 1.48.77 2.73 1.91 3.48.02.02.04.05.06.07l54.97 31.98 45.31-16.48c.23-.09.47-.13.72-.13h6.3V60.87l-16.87-7.55h.01zm.52-4.33c.14.03.27.07.4.13l15.95 7.09v-3.02c0-1.16.95-2.1 2.1-2.1h29.81c1.01.19 1.73 1.08 1.71 2.1v46.23a2.1 2.1 0 0 1-2.1 2.1h-16.81c-1.16.02-2.12-.91-2.13-2.07-.01-1.16.91-2.12 2.08-2.13h14.76V55.29h-25.22v44.13c.02 1.16-.91 2.11-2.07 2.13s-2.12-.91-2.13-2.07v-6.36h-5.91l-45.9 16.68c-.59.2-1.24.13-1.77-.2L4.65 77.16l-.06-.06C2.22 75.61.65 73 .65 70.01c0-4.62 3.79-8.41 8.41-8.41.68 0 1.34.04 1.97.2.31.07.25.1.33.13.08.03.14.03.27.07.24.08.58.18.99.33.8.29 1.89.76 3.22 1.25 2.64.97 6.12 2.27 9.59 3.55 6.92 2.57 13.79 5.13 13.79 5.13 1.41-1.23 3.12-1.99 4.86-2.5l.2-.06 52.27-20.56c.39-.17.82-.21 1.25-.13M40.58 4.85c-12.79 0-23.12 10.33-23.12 23.12s10.33 23.11 23.12 23.11 23.11-10.33 23.11-23.11S53.37 4.85 40.58 4.85m0-4.2C55.64.65 67.9 12.91 67.9 27.97S55.65 55.29 40.58 55.29 13.25 43.03 13.25 27.97 25.51.65 40.58.65M35.83 19.24c.67-.62 1.65-1.03 2.95-1.26v7.69c-1.46-.52-2.48-1.1-3.07-1.71-.59-.62-.88-1.42-.88-2.43 0-.91.33-1.67 1.01-2.29m5.64 18.7v-7.73c1.58.55 2.69 1.12 3.34 1.7.65.58.97 1.37.97 2.36 0 2.01-1.44 3.23-4.31 3.67m7.29-6.99c-.51-.84-1.3-1.6-2.38-2.25-1.08-.66-2.72-1.36-4.91-2.1v-8.69c2.06.15 4.16.65 6.28 1.48l1.15-2.9c-2.35-.97-4.83-1.5-7.44-1.57v-3.67h-2.69v3.71c-2.38.27-4.26.97-5.64 2.14-1.39 1.16-2.08 2.66-2.08 4.47s.58 3.42 1.75 4.62c1.16 1.2 3.15 2.25 5.97 3.14v8.81c-1.36-.02-2.78-.21-4.28-.56-1.49-.35-2.75-.77-3.78-1.25v3.46c.93.43 2.12.76 3.55 1 1.44.24 2.93.37 4.5.4v4.51h2.69v-4.69c2.58-.32 4.57-1.09 5.97-2.33 1.39-1.23 2.09-2.79 2.09-4.68 0-1.19-.25-2.21-.76-3.06`
([View in Visualizer](https://svg-path-visualizer.netlify.app/#M97.25%2053.32%2045.57%2073.61c-.07.02-.13.05-.2.06-1.49.43-2.74%201.1-3.55%201.84-.8.75-1.25%201.52-1.25%202.89%200%202.36%201.84%204.2%204.2%204.2h20.55l20.69-8.28c1.03-.54%202.3-.14%202.84.88.54%201.03.14%202.29-.88%202.84-.12.06-.25.12-.38.16l-21.01%208.41c-.25.12-.52.18-.79.2H44.78c-4.62%200-8.41-3.79-8.41-8.41%200-.93.19-1.75.46-2.57-.82-.31-6.41-2.39-12.87-4.79-3.46-1.29-6.95-2.58-9.59-3.55-1.32-.49-2.43-.89-3.22-1.18-.4-.15-.7-.32-.92-.4-.09-.03-.15-.05-.2-.06-.32-.07-.64-.06-.99-.06-2.34%200-4.2%201.86-4.2%204.2%200%201.48.77%202.73%201.91%203.48.02.02.04.05.06.07l54.97%2031.98%2045.31-16.48c.23-.09.47-.13.72-.13h6.3V60.87l-16.87-7.55h.01zm.52-4.33c.14.03.27.07.4.13l15.95%207.09v-3.02c0-1.16.95-2.1%202.1-2.1h29.81c1.01.19%201.73%201.08%201.71%202.1v46.23a2.1%202.1%200%200%201-2.1%202.1h-16.81c-1.16.02-2.12-.91-2.13-2.07-.01-1.16.91-2.12%202.08-2.13h14.76V55.29h-25.22v44.13c.02%201.16-.91%202.11-2.07%202.13s-2.12-.91-2.13-2.07v-6.36h-5.91l-45.9%2016.68c-.59.2-1.24.13-1.77-.2L4.65%2077.16l-.06-.06C2.22%2075.61.65%2073%20.65%2070.01c0-4.62%203.79-8.41%208.41-8.41.68%200%201.34.04%201.97.2.31.07.25.1.33.13.08.03.14.03.27.07.24.08.58.18.99.33.8.29%201.89.76%203.22%201.25%202.64.97%206.12%202.27%209.59%203.55%206.92%202.57%2013.79%205.13%2013.79%205.13%201.41-1.23%203.12-1.99%204.86-2.5l.2-.06%2052.27-20.56c.39-.17.82-.21%201.25-.13M40.58%204.85c-12.79%200-23.12%2010.33-23.12%2023.12s10.33%2023.11%2023.12%2023.11%2023.11-10.33%2023.11-23.11S53.37%204.85%2040.58%204.85m0-4.2C55.64.65%2067.9%2012.91%2067.9%2027.97S55.65%2055.29%2040.58%2055.29%2013.25%2043.03%2013.25%2027.97%2025.51.65%2040.58.65M35.83%2019.24c.67-.62%201.65-1.03%202.95-1.26v7.69c-1.46-.52-2.48-1.1-3.07-1.71-.59-.62-.88-1.42-.88-2.43%200-.91.33-1.67%201.01-2.29m5.64%2018.7v-7.73c1.58.55%202.69%201.12%203.34%201.7.65.58.97%201.37.97%202.36%200%202.01-1.44%203.23-4.31%203.67m7.29-6.99c-.51-.84-1.3-1.6-2.38-2.25-1.08-.66-2.72-1.36-4.91-2.1v-8.69c2.06.15%204.16.65%206.28%201.48l1.15-2.9c-2.35-.97-4.83-1.5-7.44-1.57v-3.67h-2.69v3.71c-2.38.27-4.26.97-5.64%202.14-1.39%201.16-2.08%202.66-2.08%204.47s.58%203.42%201.75%204.62c1.16%201.2%203.15%202.25%205.97%203.14v8.81c-1.36-.02-2.78-.21-4.28-.56-1.49-.35-2.75-.77-3.78-1.25v3.46c.93.43%202.12.76%203.55%201%201.44.24%202.93.37%204.5.4v4.51h2.69v-4.69c2.58-.32%204.57-1.09%205.97-2.33%201.39-1.23%202.09-2.79%202.09-4.68%200-1.19-.25-2.21-.76-3.06))<br><br>
<b>SVG Width:</b> 148.4<br><br>
<b>SVG Height:</b> 110.55<br><br>
<b>Result:</b>
```dart
final Path path = Path();
path.moveTo(
  0.6553234501347709 * size.width,
  0.4823156942559928 * size.height,
);
path.lineTo(
  0.3070754716981132 * size.width,
  0.6658525554047943 * size.height,
);
path.cubicTo(
  0.30660377358490565 * size.width,
  0.6660334690185437 * size.height,
  0.306199460916442 * size.width,
  0.6663048394391677 * size.height,
  0.3057277628032345 * size.width,
  0.6663952962460425 * size.height,
);
path.cubicTo(
  0.2956873315363881 * size.width,
  0.6702849389416554 * size.height,
  0.2872641509433962 * size.width,
  0.6763455450022614 * size.height,
  0.28180592991913744 * size.width,
  0.6830393487109906 * size.height,
);
path.cubicTo(
  0.27641509433962264 * size.width,
  0.6898236092265944 * size.height,
  0.27338274932614554 * size.width,
  0.6967887833559475 * size.height,
  0.27338274932614554 * size.width,
  0.7091813658977839 * size.height,
);
path.cubicTo(
  0.27338274932614554 * size.width,
  0.7305291723202172 * size.height,
  0.28578167115902964 * size.width,
  0.7471732247851652 * size.height,
  0.3016846361185984 * size.width,
  0.7471732247851652 * size.height,
);
path.lineTo(
  0.4401617250673855 * size.width,
  0.7471732247851652 * size.height,
);
path.lineTo(
  0.5795822102425876 * size.width,
  0.6722749886928993 * size.height,
);
path.cubicTo(
  0.5865229110512129 * size.width,
  0.6673903211216644 * size.height,
  0.5950808625336927 * size.width,
  0.6710085933966532 * size.height,
  0.5987196765498652 * size.width,
  0.6802351876978743 * size.height,
);
path.cubicTo(
  0.6023584905660379 * size.width,
  0.6895522388059702 * size.height,
  0.5996630727762804 * size.width,
  0.7009497964721846 * size.height,
  0.592789757412399 * size.width,
  0.705924920850294 * size.height,
);
path.cubicTo(
  0.5919811320754718 * size.width,
  0.7064676616915424 * size.height,
  0.5911051212938006 * size.width,
  0.7070104025327907 * size.height,
  0.5902291105121295 * size.width,
  0.7073722297602895 * size.height,
);
path.lineTo(
  0.44865229110512134 * size.width,
  0.7834464043419267 * size.height,
);
path.cubicTo(
  0.44696765498652297 * size.width,
  0.7845318860244234 * size.height,
  0.4451482479784368 * size.width,
  0.7850746268656718 * size.height,
  0.4433288409703504 * size.width,
  0.7852555404794211 * size.height,
);
path.lineTo(
  0.3017520215633423 * size.width,
  0.7852555404794211 * size.height,
);
path.cubicTo(
  0.2706199460916442 * size.width,
  0.7852555404794211 * size.height,
  0.24508086253369274 * size.width,
  0.7509724106739032 * size.height,
  0.24508086253369274 * size.width,
  0.7091813658977839 * size.height,
);
path.cubicTo(
  0.24508086253369274 * size.width,
  0.7007688828584351 * size.height,
  0.2463611859838275 * size.width,
  0.6933514246947083 * size.height,
  0.24818059299191378 * size.width,
  0.6859339665309816 * size.height,
);
path.cubicTo(
  0.24265498652291106 * size.width,
  0.6831298055178653 * size.height,
  0.20498652291105124 * size.width,
  0.6643147896879241 * size.height,
  0.16145552560646906 * size.width,
  0.642605156037992 * size.height,
);
path.cubicTo(
  0.13814016172506743 * size.width,
  0.6309362279511533 * size.height,
  0.11462264150943402 * size.width,
  0.6192672998643148 * size.height,
  0.0968328840970351 * size.width,
  0.6104929895974673 * size.height,
);
path.cubicTo(
  0.08793800539083563 * size.width,
  0.6060606060606062 * size.height,
  0.08045822102425881 * size.width,
  0.6024423337856175 * size.height,
  0.07513477088948792 * size.width,
  0.5998190863862506 * size.height,
);
path.cubicTo(
  0.0724393530997305 * size.width,
  0.5984622342831298 * size.height,
  0.07041778975741245 * size.width,
  0.5969244685662597 * size.height,
  0.06893530997304587 * size.width,
  0.5962008141112619 * size.height,
);
path.cubicTo(
  0.06832884097035045 * size.width,
  0.5959294436906377 * size.height,
  0.06792452830188683 * size.width,
  0.5957485300768883 * size.height,
  0.06758760107816716 * size.width,
  0.5956580732700135 * size.height,
);
path.cubicTo(
  0.06543126684636123 * size.width,
  0.5950248756218905 * size.height,
  0.0632749326145553 * size.width,
  0.5951153324287652 * size.height,
  0.06091644204851757 * size.width,
  0.5951153324287652 * size.height,
);
path.cubicTo(
  0.04514824797843671 * size.width,
  0.5951153324287652 * size.height,
  0.03261455525606474 * size.width,
  0.6119402985074627 * size.height,
  0.03261455525606474 * size.width,
  0.6331071913161465 * size.height,
);
path.cubicTo(
  0.03261455525606474 * size.width,
  0.6464947987336047 * size.height,
  0.03780323450134777 * size.width,
  0.6578018995929443 * size.height,
  0.045485175202156385 * size.width,
  0.6645861601085482 * size.height,
);
path.cubicTo(
  0.045619946091644256 * size.width,
  0.6647670737222976 * size.height,
  0.04575471698113213 * size.width,
  0.6650384441429217 * size.height,
  0.04588948787061999 * size.width,
  0.6652193577566712 * size.height,
);
path.lineTo(
  0.4163072776280324 * size.width,
  0.9545002261420171 * size.height,
);
path.lineTo(
  0.7216307277628032 * size.width,
  0.805427408412483 * size.height,
);
path.cubicTo(
  0.7231805929919137 * size.width,
  0.8046132971506105 * size.height,
  0.7247978436657682 * size.width,
  0.8042514699231117 * size.height,
  0.7264824797843665 * size.width,
  0.8042514699231117 * size.height,
);
path.lineTo(
  0.7689353099730458 * size.width,
  0.8042514699231117 * size.height,
);
path.lineTo(
  0.7689353099730458 * size.width,
  0.5506105834464043 * size.height,
);
path.lineTo(
  0.6552560646900268 * size.width,
  0.4823156942559928 * size.height,
);
path.lineTo(
  0.6553234501347709 * size.width,
  0.4823156942559928 * size.height,
);
path.close();
path.moveTo(
  0.6588274932614555 * size.width,
  0.44314789687924017 * size.height,
);
path.cubicTo(
  0.6597708894878705 * size.width,
  0.44341926729986436 * size.height,
  0.6606469002695416 * size.width,
  0.4437810945273632 * size.height,
  0.661522911051213 * size.width,
  0.44432383536861153 * size.height,
);
path.lineTo(
  0.7690026954177898 * size.width,
  0.5084577114427862 * size.height,
);
path.lineTo(
  0.7690026954177898 * size.width,
  0.4811397557666215 * size.height,
);
path.cubicTo(
  0.7690026954177898 * size.width,
  0.4706467661691543 * size.height,
  0.7754043126684637 * size.width,
  0.46214382632293083 * size.height,
  0.7831536388140161 * size.width,
  0.46214382632293083 * size.height,
);
path.lineTo(
  0.9840296495956873 * size.width,
  0.46214382632293083 * size.height,
);
path.cubicTo(
  0.9908355795148247 * size.width,
  0.46386250565355047 * size.height,
  0.995687331536388 * size.width,
  0.4719131614654003 * size.height,
  0.9955525606469003 * size.width,
  0.4811397557666215 * size.height,
);
path.lineTo(
  0.9955525606469003 * size.width,
  0.8993215739484397 * size.height,
);
path.arcToPoint(
  Offset(
    0.9814016172506739 * size.width,
    0.9183175033921303 * size.height,
  ),
  radius: Radius.elliptical(
    0.014150943396226415 * size.width,
    0.018995929443690638 * size.height,
  ),
  rotation: 0,
  largeArc: false,
  clockwise: true,
);
path.lineTo(
  0.8681266846361186 * size.width,
  0.9183175033921303 * size.height,
);
path.cubicTo(
  0.8603099730458221 * size.width,
  0.9184984170058796 * size.height,
  0.8538409703504043 * size.width,
  0.910085933966531 * size.height,
  0.8537735849056605 * size.width,
  0.8995929443690638 * size.height,
);
path.cubicTo(
  0.8537061994609165 * size.width,
  0.8890999547715966 * size.height,
  0.8599056603773586 * size.width,
  0.8804161013116237 * size.height,
  0.867789757412399 * size.width,
  0.880325644504749 * size.height,
);
path.lineTo(
  0.9672506738544475 * size.width,
  0.880325644504749 * size.height,
);
path.lineTo(
  0.9672506738544475 * size.width,
  0.500135685210312 * size.height,
);
path.lineTo(
  0.7973045822102427 * size.width,
  0.500135685210312 * size.height,
);
path.lineTo(
  0.7973045822102427 * size.width,
  0.8993215739484397 * size.height,
);
path.cubicTo(
  0.7974393530997306 * size.width,
  0.9098145635459068 * size.height,
  0.7911725067385447 * size.width,
  0.9184079601990051 * size.height,
  0.7833557951482482 * size.width,
  0.9185888738127544 * size.height,
);
path.cubicTo(
  0.7755390835579516 * size.width,
  0.9187697874265038 * size.height,
  0.7690700808625338 * size.width,
  0.9103573043871551 * size.height,
  0.76900269541779 * size.width,
  0.899864314789688 * size.height,
);
path.lineTo(
  0.76900269541779 * size.width,
  0.8423337856173678 * size.height,
);
path.lineTo(
  0.7291778975741242 * size.width,
  0.8423337856173678 * size.height,
);
path.lineTo(
  0.41987870619946116 * size.width,
  0.9932157394843963 * size.height,
);
path.cubicTo(
  0.41590296495956897 * size.width,
  0.9950248756218907 * size.height,
  0.41152291105121314 * size.width,
  0.9943916779737676 * size.height,
  0.4079514824797846 * size.width,
  0.991406603346902 * size.height,
);
path.lineTo(
  0.03133423180592992 * size.width,
  0.6979647218453189 * size.height,
);
path.lineTo(
  0.030929919137466313 * size.width,
  0.6974219810040705 * size.height,
);
path.cubicTo(
  0.01495956873315364 * size.width,
  0.6839439167797376 * size.height,
  0.004380053908355795 * size.width,
  0.6603346901854364 * size.height,
  0.004380053908355795 * size.width,
  0.6332881049298961 * size.height,
);
path.cubicTo(
  0.004380053908355795 * size.width,
  0.5914970601537766 * size.height,
  0.02991913746630728 * size.width,
  0.5572139303482588 * size.height,
  0.06105121293800539 * size.width,
  0.5572139303482588 * size.height,
);
path.cubicTo(
  0.065633423180593 * size.width,
  0.5572139303482588 * size.height,
  0.07008086253369272 * size.width,
  0.5575757575757576 * size.height,
  0.07432614555256065 * size.width,
  0.5590230664857532 * size.height,
);
path.cubicTo(
  0.07641509433962265 * size.width,
  0.5596562641338761 * size.height,
  0.07601078167115903 * size.width,
  0.5599276345545003 * size.height,
  0.07654986522911052 * size.width,
  0.5601990049751245 * size.height,
);
path.cubicTo(
  0.077088948787062 * size.width,
  0.5604703753957487 * size.height,
  0.07749326145552561 * size.width,
  0.5604703753957487 * size.height,
  0.07836927223719677 * size.width,
  0.5608322026232475 * size.height,
);
path.cubicTo(
  0.07998652291105121 * size.width,
  0.5615558570782453 * size.height,
  0.08227762803234502 * size.width,
  0.5624604251469925 * size.height,
  0.08504043126684636 * size.width,
  0.5638172772501132 * size.height,
);
path.cubicTo(
  0.0904312668463612 * size.width,
  0.56644052464948 * size.height,
  0.09777628032345013 * size.width,
  0.5706919945725917 * size.height,
  0.10673854447439354 * size.width,
  0.5751243781094528 * size.height,
);
path.cubicTo(
  0.12452830188679245 * size.width,
  0.5838986883763004 * size.height,
  0.14797843665768193 * size.width,
  0.5956580732700136 * size.height,
  0.1713611859838275 * size.width,
  0.6072365445499774 * size.height,
);
path.cubicTo(
  0.21799191374663074 * size.width,
  0.6304839439167798 * size.height,
  0.2642857142857143 * size.width,
  0.6536408864767075 * size.height,
  0.2642857142857143 * size.width,
  0.6536408864767075 * size.height,
);
path.cubicTo(
  0.2737870619946091 * size.width,
  0.6425146992311171 * size.height,
  0.28530997304582206 * size.width,
  0.6356399819086387 * size.height,
  0.29703504043126683 * size.width,
  0.6310266847580281 * size.height,
);
path.lineTo(
  0.29838274932614556 * size.width,
  0.6304839439167798 * size.height,
);
path.lineTo(
  0.6506064690026955 * size.width,
  0.4445047489823609 * size.height,
);
path.cubicTo(
  0.653234501347709 * size.width,
  0.4429669832654907 * size.height,
  0.6561320754716982 * size.width,
  0.4426051560379919 * size.height,
  0.6590296495956873 * size.width,
  0.4433288104929896 * size.height,
);
path.moveTo(
  0.2734501347708895 * size.width,
  0.043871551334237896 * size.height,
);
path.cubicTo(
  0.1872641509433962 * size.width,
  0.043871551334237896 * size.height,
  0.11765498652291102 * size.width,
  0.1373134328358209 * size.height,
  0.11765498652291102 * size.width,
  0.2530076888285843 * size.height,
);
path.cubicTo(
  0.11765498652291102 * size.width,
  0.36870194482134777 * size.height,
  0.1872641509433962 * size.width,
  0.4620533695160561 * size.height,
  0.2734501347708895 * size.width,
  0.4620533695160561 * size.height,
);
path.cubicTo(
  0.35963611859838274 * size.width,
  0.4620533695160561 * size.height,
  0.42917789757412395 * size.width,
  0.3686114880144731 * size.height,
  0.42917789757412395 * size.width,
  0.2530076888285843 * size.height,
);
path.cubicTo(
  0.42917789757412395 * size.width,
  0.1374038896426956 * size.height,
  0.35963611859838274 * size.width,
  0.043871551334237896 * size.height,
  0.2734501347708895 * size.width,
  0.043871551334237896 * size.height,
);
path.moveTo(
  0.2734501347708895 * size.width,
  0.005879692446856621 * size.height,
);
path.cubicTo(
  0.37493261455525606 * size.width,
  0.005879692446856626 * size.height,
  0.45754716981132076 * size.width,
  0.11677973767526006 * size.height,
  0.45754716981132076 * size.width,
  0.2530076888285843 * size.height,
);
path.cubicTo(
  0.45754716981132076 * size.width,
  0.38923563998190863 * size.height,
  0.375 * size.width,
  0.500135685210312 * size.height,
  0.2734501347708895 * size.width,
  0.500135685210312 * size.height,
);
path.cubicTo(
  0.17190026954177895 * size.width,
  0.500135685210312 * size.height,
  0.08928571428571429 * size.width,
  0.38923563998190863 * size.height,
  0.08928571428571429 * size.width,
  0.2530076888285843 * size.height,
);
path.cubicTo(
  0.08928571428571429 * size.width,
  0.11677973767526004 * size.height,
  0.17190026954177898 * size.width,
  0.005879692446856626 * size.height,
  0.2734501347708895 * size.width,
  0.005879692446856626 * size.height,
);
path.moveTo(
  0.24144204851752019 * size.width,
  0.1740388964269561 * size.height,
);
path.cubicTo(
  0.24595687331536387 * size.width,
  0.16843057440072365 * size.height,
  0.2525606469002695 * size.width,
  0.16472184531886022 * size.height,
  0.26132075471698113 * size.width,
  0.16264133876074172 * size.height,
);
path.lineTo(
  0.26132075471698113 * size.width,
  0.23220262324739935 * size.height,
);
path.cubicTo(
  0.25148247978436655 * size.width,
  0.22749886928991406 * size.height,
  0.2446091644204852 * size.width,
  0.22225237449118043 * size.height,
  0.240633423180593 * size.width,
  0.2167345092718227 * size.height,
);
path.cubicTo(
  0.23665768194070078 * size.width,
  0.2111261872455902 * size.height,
  0.23470350404312668 * size.width,
  0.20388964269561285 * size.height,
  0.23470350404312668 * size.width,
  0.19475350520126639 * size.height,
);
path.cubicTo(
  0.23470350404312668 * size.width,
  0.1865219357756671 * size.height,
  0.2369272237196765 * size.width,
  0.1796472184531886 * size.height,
  0.24150943396226413 * size.width,
  0.1740388964269561 * size.height,
);
path.moveTo(
  0.2795148247978436 * size.width,
  0.34319312528267754 * size.height,
);
path.lineTo(
  0.2795148247978436 * size.width,
  0.273270013568521 * size.height,
);
path.cubicTo(
  0.2901617250673854 * size.width,
  0.27824513794663047 * size.height,
  0.2976415094339622 * size.width,
  0.28340117593848935 * size.height,
  0.302021563342318 * size.width,
  0.28864767073722297 * size.height,
);
path.cubicTo(
  0.3064016172506738 * size.width,
  0.29389416553595654 * size.height,
  0.3085579514824797 * size.width,
  0.3010402532790592 * size.height,
  0.3085579514824797 * size.width,
  0.30999547715965625 * size.height,
);
path.cubicTo(
  0.3085579514824797 * size.width,
  0.3281772953414744 * size.height,
  0.2988544474393531 * size.width,
  0.3392130257801899 * size.height,
  0.27951482479784356 * size.width,
  0.34319312528267754 * size.height,
);
path.moveTo(
  0.3286388140161724 * size.width,
  0.27996381727725006 * size.height,
);
path.cubicTo(
  0.3252021563342317 * size.width,
  0.2723654454997738 * size.height,
  0.31987870619946085 * size.width,
  0.2654907281772953 * size.height,
  0.3126010781671158 * size.width,
  0.2596110357304387 * size.height,
);
path.cubicTo(
  0.3053234501347708 * size.width,
  0.25364088647670735 * size.height,
  0.29427223719676543 * size.width,
  0.24730890999547714 * size.height,
  0.27951482479784356 * size.width,
  0.24061510628674804 * size.height,
);
path.lineTo(
  0.27951482479784356 * size.width,
  0.1620081411126187 * size.height,
);
path.cubicTo(
  0.2933962264150943 * size.width,
  0.16336499321573944 * size.height,
  0.30754716981132063 * size.width,
  0.1678878335594753 * size.height,
  0.321832884097035 * size.width,
  0.17539574853007686 * size.height,
);
path.lineTo(
  0.3295822102425875 * size.width,
  0.14916327453640885 * size.height,
);
path.cubicTo(
  0.3137466307277627 * size.width,
  0.14038896426956127 * size.height,
  0.2970350404312668 * size.width,
  0.13559475350520125 * size.height,
  0.2794474393530997 * size.width,
  0.13496155585707822 * size.height,
);
path.lineTo(
  0.2794474393530997 * size.width,
  0.10176390773405697 * size.height,
);
path.lineTo(
  0.2613207547169811 * size.width,
  0.10176390773405697 * size.height,
);
path.lineTo(
  0.2613207547169811 * size.width,
  0.1353233830845771 * size.height,
);
path.cubicTo(
  0.24528301886792447 * size.width,
  0.13776571687019445 * size.height,
  0.23261455525606464 * size.width,
  0.14409769335142467 * size.height,
  0.22331536388140155 * size.width,
  0.1546811397557666 * size.height,
);
path.cubicTo(
  0.21394878706199455 * size.width,
  0.1651741293532338 * size.height,
  0.20929919137466302 * size.width,
  0.17874265038444143 * size.height,
  0.20929919137466302 * size.width,
  0.19511533242876525 * size.height,
);
path.cubicTo(
  0.20929919137466302 * size.width,
  0.21148801447308907 * size.height,
  0.21320754716981127 * size.width,
  0.22605156037991855 * size.height,
  0.22109164420485172 * size.width,
  0.23690637720488467 * size.height,
);
path.cubicTo(
  0.22890835579514818 * size.width,
  0.24776119402985072 * size.height,
  0.2423180592991913 * size.width,
  0.257259158751696 * size.height,
  0.2613207547169811 * size.width,
  0.2653098145635459 * size.height,
);
path.lineTo(
  0.2613207547169811 * size.width,
  0.3450022614201719 * size.height,
);
path.cubicTo(
  0.2521563342318059 * size.width,
  0.34482134780642243 * size.height,
  0.24258760107816707 * size.width,
  0.3431026684758028 * size.height,
  0.23247978436657676 * size.width,
  0.3399366802351877 * size.height,
);
path.cubicTo(
  0.2224393530997304 * size.width,
  0.33677069199457255 * size.height,
  0.21394878706199455 * size.width,
  0.3329715061058344 * size.height,
  0.20700808625336922 * size.width,
  0.328629579375848 * size.height,
);
path.lineTo(
  0.20700808625336922 * size.width,
  0.3599276345545002 * size.height,
);
path.cubicTo(
  0.21327493261455518 * size.width,
  0.3638172772501131 * size.height,
  0.22129380053908349 * size.width,
  0.36680235187697874 * size.height,
  0.23092991913746622 * size.width,
  0.36897331524197197 * size.height,
);
path.cubicTo(
  0.2406334231805929 * size.width,
  0.3711442786069652 * size.height,
  0.2506738544474393 * size.width,
  0.3723202170963365 * size.height,
  0.26125336927223713 * size.width,
  0.37259158751696064 * size.height,
);
path.lineTo(
  0.26125336927223713 * size.width,
  0.4133876074174581 * size.height,
);
path.lineTo(
  0.2793800539083557 * size.width,
  0.4133876074174581 * size.height,
);
path.lineTo(
  0.2793800539083557 * size.width,
  0.37096336499321575 * size.height,
);
path.cubicTo(
  0.296765498652291 * size.width,
  0.3680687471732248 * size.height,
  0.31017520215633415 * size.width,
  0.36110357304387153 * size.height,
  0.3196091644204851 * size.width,
  0.3498869289914066 * size.height,
);
path.cubicTo(
  0.3289757412398921 * size.width,
  0.3387607417458164 * size.height,
  0.3336927223719675 * size.width,
  0.32464947987336046 * size.height,
  0.3336927223719675 * size.width,
  0.3075531433740389 * size.height,
);
path.cubicTo(
  0.3336927223719675 * size.width,
  0.29678878335594755 * size.height,
  0.33200808625336914 * size.width,
  0.28756218905472636 * size.height,
  0.32857142857142846 * size.width,
  0.2798733604703754 * size.height,
);
```