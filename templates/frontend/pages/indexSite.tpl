{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

<div class="container page-site">
	<div class="row justify-content-md-center">
		<div class="col-md-12">
			<div class="page-content">
				{if $about}
					<div class="site-about">
						{$about|nl2br}
					</div>
				{/if}
			</div>
			<div class="site-journals">
				<h2 class="sr-only">{translate key="journal.journals"}</h2>
				{if !count($journals)}
					<p>{translate key="site.noJournals"}</p>
				{else}
					<div class="row row-eq-height align-items-start">
						{iterate from=journals item=journal}
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
						{capture assign="url"}{url journal=$journal->getPath()}{/capture}
						{assign var="thumb" value=$journal->getLocalizedSetting('journalThumbnail')}
						{assign var="description" value=$journal->getLocalizedDescription()}

						<div class="site-journal">
							{if $thumb}
							<a class="site-journal-img" href="{$url|escape}">
								<img class="card-img-top" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $altText} alt="{$altText|escape}"{/if}>
							</a>

							{else}
								<a class="site-journal-img" href="{$url|escape}">
								<div class="journal-img-placeholder"></div>
								</a>
							{/if}


							<div class="site-journal-body">
								<h3 class="site-journal-title">
									<a href="{$url|escape}" rel="bookmark">
										{$journal->getLocalizedName()}
									</a>
								</h3>
								<div class="site-journal-description journal-intro">
									{$description|nl2br}
								</div>
								<p class="links journal-intro">
									<a class="btn" href="{$url|escape}">
										{translate key="site.journalView"}
									</a>
									<a class="btn" href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
										{translate key="site.journalCurrent"}
									</a>
								</p>
							</div>

						</div>

					</div>
					{/iterate}
				</div>

				{if $journals->getPageCount() > 0}
					<div class="cmp_pagination">
						{page_info iterator=$journals}
						{page_links anchor="journals" name="journals" iterator=$journals}
					</div>
				{/if}
			{/if}
			</div>
		</div>
	</div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
