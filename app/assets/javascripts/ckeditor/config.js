/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language = 'pt-br';
    config.toolbar = 'Full';

    config.toolbar_Full =
    [
        ['Maximize'],
        ['Cut','Copy','Paste','PasteText'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['ShowBlocks', 'Source'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['Link','Unlink'],
        ['Image','Table','HorizontalRule','SpecialChar'],
    ];

    config.toolbar_Basic =
    [
        ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
    ];
};

